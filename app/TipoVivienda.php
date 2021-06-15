<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoVivienda extends Model
{
    protected $table = 'tipoviviendas';
    protected $fillable = ['nombre']; 
}
