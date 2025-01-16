<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use Illuminate\Http\Request;

class MataKuliahController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return MataKuliah::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $matakuliah = MataKuliah::create($request->all());
        return response()->json($matakuliah, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        return MataKuliah::find($id);
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
        $matakuliah = MataKuliah::find($id);
        $matakuliah->update($request->all());
        return response()->json($matakuliah, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        MataKuliah::destroy($id);
        return response()->json(null, 204);
    }
}
