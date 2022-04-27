<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ViaAccesoFinca extends Model
{
    protected $table = 'viasaccesofincas';
    protected $fillable = ['via_id','finca_id'];
    public function via(){
        return $this->belongsTo('App\ViaAcceso','via_id','id');
    }
    public function finca(){
        return $this->belongsTo('App\FincaComcacaot','finca_id','id');
    }
}
