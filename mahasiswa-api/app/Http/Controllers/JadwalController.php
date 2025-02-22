<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use Illuminate\Http\Request;

class JadwalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Jadwal::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_matakuliah'=>'required|string',
            'tanggal'=>'required|date',
            'jam'=>'required|string',
            'ruangan'=>'required|string',
        ]);

        $jadwal = Jadwal::create($validated);

        return response()->json($jadwal, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        return Jadwal::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'nama_matakuliah'=>'required|string',
            'tanggal'=>'required|date',
            'jam'=>'required|string',
            'ruangan'=>'required|string',
        ]);

        $jadwal = Jadwal::find($id);
        $jadwal->update($validated);

        return response()->json($jadwal, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Jadwal::destroy($id);
        return response()->json(null, 204);
    }
}
