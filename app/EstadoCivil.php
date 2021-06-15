<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EstadoCivil extends Model
{
    protected $table = 'estadocivils';
    protected $fillable = ['nombre']; 
}
