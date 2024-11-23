<?php

namespace App\Http\Controllers;

use App\Models\Level;
use Illuminate\Http\Request;

class LevelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $levels = Level::all();
        return response()->json($levels);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $level = Level::create($request->all());
        return response()->json($level, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $level = Level::find($id);
        if (!$level) {
            return response()->json(['error' => 'Not Found'], 404);
        }
        return $level;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $level = Level::find($id);
        if (!$level) {
            return response()->json(['error' => 'Not Found'], 404);
        }
        $level->update($request->all());
        return response()->json($level);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $level = Level::find($id);
        if (!$level) {
            return response()->json(['error' => 'Not Found'], 404);
        }
        $level->delete();
        return response()->json(['message' => 'Deleted successfully']);
    }
}
