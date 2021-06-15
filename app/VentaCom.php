<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VentaCom extends Model
{
    protected $table = 'ventacoms';
    protected $fillable = ['productor_id',
    'lugarVenta_id','vereda_id','zona_id','fechaVenta','totalKilos',
    'totalKilosNetos','totalIncentivoXkg','totalIncentivo','totalNeto','estado_id','observaciones'];

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function lugarVenta(){
        return $this->belongsTo('App\LugarVenta','lugarVenta_id','id');
    }
    public function vereda(){
        return $this->belongsTo('App\VeredaCom','vereda_id','id');
    }
    public function zona(){
        return $this->belongsTo('App\Zona','zona_id','id');
    }
    public function estadoVenta(){
        return $this->belongsTo('App\EstadoVenta','estado_id','id');
    }
}
