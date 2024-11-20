<?php

namespace App\Support;

class UserStatus
{
    public const ACTIVE = 'active';
    public const INACTIVE = 'inactive';
    public const PENDING = 'pending';
    public const SUSPENDED = 'suspended';
    public const BANNED = 'banned';

    public static function getStatuses(): array
    {
        return [
            self::ACTIVE,
            self::INACTIVE,
            self::PENDING,
            self::SUSPENDED,
            self::BANNED
        ];
    }

    /**
     * Check if a given status is valid
     * 
     * @param string $status
     * @return bool
     */
    public static function isValid(string $status): bool
    {
        return in_array($status, self::getStatuses());
    }

    /**
     * Get a human-readable label for the status
     * 
     * @param string $status
     * @return string
     */
    public static function getLabel(string $status): string
    {
        switch ($status) {
            case self::ACTIVE:
                return 'Active';
            case self::INACTIVE:
                return 'Inactive';
            case self::PENDING:
                return 'Pending Activation';
            case self::SUSPENDED:
                return 'Suspended';
            case self::BANNED:
                return 'Banned';
            default:
                return 'Unknown';
        }
    }

    /**
     * Get CSS class for status representation
     * 
     * @param string $status
     * @return string
     */
    public static function getCssClass(string $status): string
    {
        switch ($status) {
            case self::ACTIVE:
                return 'text-green-500';
            case self::INACTIVE:
                return 'text-gray-500';
            case self::PENDING:
                return 'text-yellow-500';
            case self::SUSPENDED:
                return 'text-orange-500';
            case self::BANNED:
                return 'text-red-500';
            default:
                return 'text-gray-500';
        }
    }
}