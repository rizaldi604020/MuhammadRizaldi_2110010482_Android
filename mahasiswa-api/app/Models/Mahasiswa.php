<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Mahasiswa extends Model
{
    use HasFactory;

    protected $table="mahasiswa";

    protected $fillable = [
        'npm',
        'nama',
        'tempat_lahir',
        'tanggal_lahir',
        'sex',
        'alamat',
        'telp',
        'email',
        'photo'


    ];
}
