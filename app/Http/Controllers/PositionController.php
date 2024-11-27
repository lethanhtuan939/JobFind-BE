<?php

namespace App\Http\Controllers;

use App\Services\PositionService;
use Illuminate\Http\Request;

class PositionController extends Controller
{
    protected $positionService;

    public function __construct(PositionService $positionService)
    {
        $this->positionService = $positionService;
    }


    public function index()
    {
        try {
            $positions = $this->positionService->getAllPositions();
            return response()->json([
                'message' => 'Positions retrieved successfully.',
                'data' => $positions,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to retrieve positions.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $position = $this->positionService->createPosition($request->all());
            return response()->json([
                'message' => 'Position created successfully.',
                'data' => $position,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to create position.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }


    public function show($id)
    {
        try {
            $position = $this->positionService->getPositionById($id);

            if (!$position) {
                return response()->json([
                    'message' => 'Position not found.',
                ], 404);
            }

            return response()->json([
                'message' => 'Position retrieved successfully.',
                'data' => $position,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to retrieve position.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }


    public function update(Request $request, $id)
    {
        try {
            $position = $this->positionService->updatePosition($id, $request->all());

            if (!$position) {
                return response()->json([
                    'message' => 'Position not found.',
                ], 404);
            }

            return response()->json([
                'message' => 'Position updated successfully.',
                'data' => $position,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to update position.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }


    public function destroy($id)
    {
        try {
            $deleted = $this->positionService->deletePosition($id);

            if (!$deleted) {
                return response()->json([
                    'message' => 'Position not found.',
                ], 404);
            }

            return response()->json([
                'message' => 'Position deleted successfully.',
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to delete position.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}