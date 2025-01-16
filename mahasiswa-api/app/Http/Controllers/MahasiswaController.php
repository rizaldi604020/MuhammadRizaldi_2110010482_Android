<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    public function index()
    {
        return Mahasiswa::all();
    }

    public function store(Request $request)
    {
        $request->validate(
        [
            'npm'=>'required|string|unique:mahasiswa',
            'nama'=>'required|string',
            'tempat_lahir'=>'required|string',
            'tanggal_lahir'=>'required|date',
            'sex'=>'required|string',
            'alamat'=>'required|string',
            'telp'=>'required|string',
            'email'=>'required|string|email|unique:mahasiswa',
            'photo'=>'nullable|string'
        ]);

        return Mahasiswa::create($request->all());
    }

    public function show($id){
        return Mahasiswa::findOrFail($id);
    }

    public function update(Request $request, $id){
        $mahasiswa = Mahasiswa::findOrFail($id);
        $request->validate([
            'npm'=>'sometimes|required|string|unique:mahasiswa,npm,'.$mahasiswa->id,
            'email'=>'sometimes|string|email|unique:mahasiswa,email,'.$mahasiswa->id,
        ]);

        $mahasiswa->update($request->all());
        return $mahasiswa;
    }

    public function destroy($id){
        $mahasiswa = Mahasiswa::findOrFail($id);
        $mahasiswa->delete();
        return response()->noContent();
    }
}
