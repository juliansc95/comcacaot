<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Financiacion extends Model
{
    protected $table = 'financiacions';
    protected $fillable = ['nombre']; 
}
