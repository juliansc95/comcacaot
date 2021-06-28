<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoriaMora extends Model
{
    protected $table = 'categoriamoras';
    protected $fillable = ['nombre','valorUnitario','ValorDonacion','valorTransporte',
    'valorAsohof','valorCuatroPorMil']; 
}
