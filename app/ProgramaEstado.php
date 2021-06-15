<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProgramaEstado extends Model
{
    protected $table = 'programaestados';
    protected $fillable = ['nombre']; 
}
