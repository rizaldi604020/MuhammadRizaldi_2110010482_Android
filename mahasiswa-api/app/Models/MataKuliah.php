<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MataKuliah extends Model
{
    use HasFactory;
    protected $table="matakuliahs";

    protected $fillable = [
        'kode',
        'matakuliah',
        'sks',
        'semester'


    ];
}
