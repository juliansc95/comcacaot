<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VeredaCom extends Model
{
    protected $table = 'veredascoms';
    protected $fillable = ['nombre','zona_id'];
    public function zona()
    {
        return $this->belongsTo('App\Zona', 'zona_id', 'id');
    }
}
