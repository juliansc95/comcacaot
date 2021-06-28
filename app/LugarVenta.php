<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LugarVenta extends Model
{
    protected $table = 'lugarventas';
    protected $fillable = ['nombre']; 
}
