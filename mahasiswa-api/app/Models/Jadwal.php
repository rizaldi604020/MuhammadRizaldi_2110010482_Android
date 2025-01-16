<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Jadwal extends Model
{
    use HasFactory;

    protected $table="jadwals";
    
    protected $fillable = [
        'nama_matakuliah',
        'tanggal',
        'jam',
        'ruangan',
    ];
}
