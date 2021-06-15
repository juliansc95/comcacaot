<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoControl extends Model
{
    protected $table = 'tipocontrols';
    protected $fillable = ['nombre']; 
}
