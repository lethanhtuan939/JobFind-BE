<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserVerification;
use Carbon\Carbon;
use Illuminate\Support\Str;
use App\Support\UserStatus;

class OtpService
{
    public function generateOtp(User $user)
    {
        UserVerification::where('user_id', $user->id)->delete();

        $otpCode = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        return UserVerification::create([
            'user_id' => $user->id,
            'otp_code' => $otpCode,
            'expires_at' => Carbon::now()->addSeconds(60), // OTP valid for 60s
            'is_verified' => false
        ]);
    }

    public function verifyOtp(User $user, string $otpCode)
    {
        $verification = UserVerification::where('user_id', $user->id)
            ->where('otp_code', $otpCode)
            ->where('is_verified', false)
            ->first();

        if (!$verification) {
            return false;
        }

        if ($verification->isExpired()) {
            $verification->delete();
            return false;
        }

        $verification->update(['is_verified' => true]);
        $user->update(['status' => UserStatus::ACTIVE]);

        return true;
    }
}