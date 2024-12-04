<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;
use App\Models\Area;
use App\Models\Company;
use Carbon\Carbon;

class StatisticsService
{
    public function getTotalPosts()
    {
        return Post::count();
    }

    public function getTotalUsers()
    {
        return User::count();
    }

    public function getTotalCompanies()
    {
        return Company::count();
    }

    // public function getPostsByMonth()
    // {
    //     $postsByMonth = Post::selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, COUNT(*) as count')
    //         ->where('created_at', '>=', Carbon::now()->subMonths(12))
    //         ->groupBy('year', 'month')
    //         ->orderBy('year', 'asc')
    //         ->orderBy('month', 'asc')
    //         ->get()
    //         ->keyBy(function ($item) {
    //             return $item->year . '-' . str_pad($item->month, 2, '0', STR_PAD_LEFT);
    //         });

    //     $result = [];
    //     $currentDate = Carbon::now();

    //     for ($i = 0; $i < 12; $i++) {
    //         $date = $currentDate->copy()->subMonths($i);
    //         $key = $date->format('Y-m');
    //         $result[$key] = $postsByMonth->get($key)->count ?? 0;
    //     }

    //     return array_reverse($result);
    // }
    public function getPostsByMonth($year)
    {
        $postsByMonth = Post::selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, COUNT(*) as count')
            ->whereYear('created_at', $year)
            ->groupBy('year', 'month')
            ->orderBy('year', 'asc')
            ->orderBy('month', 'asc')
            ->get()
            ->keyBy(function ($item) {
                return $item->year . '-' . str_pad($item->month, 2, '0', STR_PAD_LEFT);
            });

        $result = [];
        for ($month = 1; $month <= 12; $month++) {
            $key = $year . '-' . str_pad($month, 2, '0', STR_PAD_LEFT);
            $result[$key] = $postsByMonth->get($key)->count ?? 0;
        }

        return $result;
    }

    public function getPostsByArea()
    {
        $areas = Area::all();
        $postsByArea = Post::selectRaw('area_id, COUNT(id) as count')
            ->groupBy('area_id')
            ->pluck('count', 'area_id');

        $result = $areas->map(function ($area) use ($postsByArea) {
            return [
                'area_name' => $area->name,
                'count' => $postsByArea->get($area->id, 0)
            ];
        });

        return $result;
    }
    
}