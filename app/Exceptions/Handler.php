<?php
namespace App\Exceptions;

use Illuminate\Auth\AuthenticationException;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;

class Handler extends ExceptionHandler
{
    protected $dontReport = [
        AuthenticationException::class,
        JWTException::class,
    ];

    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        $this->renderable(function (JWTException $e, $request) {
            if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException) {
                return response()->json([
                    'error' => 'Token expired',
                    'message' => 'Your token has expired. Please log in again.',
                ], 401);
            }

            if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException) {
                return response()->json([
                    'error' => 'Token invalid',
                    'message' => 'The token is invalid.',
                ], 401);
            }

            if ($e instanceof \Tymon\JWTAuth\Exceptions\JWTException) {
                return response()->json([
                    'error' => 'Token missing',
                    'message' => 'No token provided, please authenticate.',
                ], 401);
            }
        });
    }
}

