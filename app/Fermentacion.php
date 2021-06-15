<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fermentacion extends Model
{
    protected $table = 'fermentacions';
    protected $fillable = ['nombre']; 
}
