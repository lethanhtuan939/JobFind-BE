<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserVerification;
use App\Support\UserStatus;
use App\Mail\OtpVerificationMail;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\ValidationException;

class AuthService
{
    protected $otpService;

    public function __construct(OtpService $otpService)
    {
        $this->otpService = $otpService;
    }

    public function register(array $data)
    {
        $this->validateRegistration($data);

        $user = User::create([
            'username' => $data['username'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'status' => UserStatus::PENDING
        ]);

        // Generate and send OTP
        $this->sendVerificationOtp($user);

        return $user;
    }

    private function validateRegistration(array $data)
    {
        $validator = validator($data, [
            'username' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }

    public function sendVerificationOtp(User $user)
    {
        // Generate OTP
        $verification = $this->otpService->generateOtp($user);

        // Send OTP via email
        Mail::to($user->email)->send(new OtpVerificationMail($verification->otp_code));
    }

    public function verifyOtp(int $userId, string $otpCode)
    {
        // Validate input
        $this->validateOtpVerification($userId, $otpCode);

        // Find user
        $user = User::findOrFail($userId);

        // Verify OTP
        $verified = $this->otpService->verifyOtp($user, $otpCode);

        if (!$verified) {
            throw new \Exception('Invalid or expired OTP');
        }

        return $user;
    }

    private function validateOtpVerification(int $userId, string $otpCode)
    {
        $validator = validator([
            'user_id' => $userId,
            'otp_code' => $otpCode
        ], [
            'user_id' => 'required|exists:users,id',
            'otp_code' => 'required|string|size:6'
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }

    public function login(array $credentials)
    {
        // Validate login input
        $this->validateLogin($credentials);

        // Find user by email
        $user = User::where('email', $credentials['email'])->first();

        // Check if user exists and password is correct
        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            throw new \Exception('Invalid credentials');
        }

        // Check user status
        $this->checkUserStatus($user);

        // Generate authentication token
        $token = $user->createToken('auth_token')->plainTextToken;

        return [
            'user' => $user,
            'token' => $token
        ];
    }

    private function validateLogin(array $credentials)
    {
        $validator = validator($credentials, [
            'email' => 'required|email',
            'password' => 'required|string'
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }

    private function checkUserStatus(User $user)
    {
        switch ($user->status) {
            case UserStatus::PENDING:
                throw new \Exception('Please verify your email first');
            case UserStatus::INACTIVE:
                throw new \Exception('Your account is inactive');
            case UserStatus::SUSPENDED:
                throw new \Exception('Your account is suspended');
            case UserStatus::BANNED:
                throw new \Exception('Your account is banned');
        }
    }

    public function resendOtp(string $email)
    {
        // Validate email
        $validator = validator(['email' => $email], [
            'email' => 'required|email|exists:users,email'
        ]);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }

        // Find user
        $user = User::where('email', $email)->first();

        // Check if user is already verified
        if ($user->status !== UserStatus::PENDING) {
            throw new \Exception('User is already verified');
        }

        // Send new OTP
        $this->sendVerificationOtp($user);

        return $user;
    }

    public function logout(User $user)
    {
        $user->tokens()->delete();
    }
}