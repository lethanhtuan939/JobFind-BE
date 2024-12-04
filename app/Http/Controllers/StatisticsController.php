<?php

namespace App\Http\Controllers;

use App\Services\StatisticsService;
use Illuminate\Http\Request;

class StatisticsController extends Controller
{
    protected $statisticsService;

    public function __construct(StatisticsService $statisticsService)
    {
        $this->statisticsService = $statisticsService;
    }

    public function totalPosts()
    {
        return response()->json(['total' => $this->statisticsService->getTotalPosts()]);
    }

    public function totalUsers()
    {
        return response()->json(['total' => $this->statisticsService->getTotalUsers()]);
    }

    public function totalCompanies()
    {
        return response()->json(['total' => $this->statisticsService->getTotalCompanies()]);
    }

    public function postsByMonth(Request $request)
    {
        $year = $request->query('year', date('Y'));
        return response()->json(['posts_by_month' => $this->statisticsService->getPostsByMonth($year)]);
    }

    public function postsByArea()
    {
        return response()->json(['posts_by_area' => $this->statisticsService->getPostsByArea()]);
    }
}