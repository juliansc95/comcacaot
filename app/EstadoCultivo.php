<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EstadoCultivo extends Model
{
    protected $table = 'estadocultivos';
    protected $fillable = ['nombre']; 
}
