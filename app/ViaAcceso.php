<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViaAcceso extends Model
{
    protected $table = 'viasaccesos';
    protected $fillable = ['nombre'];
}
