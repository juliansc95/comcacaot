<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TiposPoda extends Model
{
    protected $table = 'tipospodas';
    protected $fillable = ['nombre']; 
}
