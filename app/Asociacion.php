<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Asociacion extends Model
{
    protected $table = 'asociacions';
    protected $fillable = ['nombre']; 
}
