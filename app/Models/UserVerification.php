<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Models\User;

class UserVerification extends Model
{
    protected $fillable = [
        'user_id', 
        'otp_code', 
        'expires_at', 
        'is_verified'
    ];

    protected $dates = ['expires_at'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Check if OTP is expired
    public function isExpired()
    {
        return $this->expires_at->isPast();
    }
}