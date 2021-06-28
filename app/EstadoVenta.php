<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EstadoVenta extends Model
{
    protected $table = 'estadoventas';
    protected $fillable = ['nombre'];
}
