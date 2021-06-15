<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Opcion extends Model
{
    protected $table = 'opcions';
    protected $fillable = ['nombre']; 
}
