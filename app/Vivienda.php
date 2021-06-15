<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vivienda extends Model
{
    protected $table = 'viviendas';
    protected $fillable = ['nombre']; 
}
