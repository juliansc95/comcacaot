<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CosechaCultivo extends Model
{
    
    protected $table = 'cosechacultivos';
    protected $fillable = [
    'productor_id','finca_id','frecuencia','frescoTotal','secoTotal',
    'beneficio','fermentacion_id','frescoTotalMes','secoTotalMes','lugarVenta_id',
    ]; 

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function finca()
    {
        return $this->belongsTo('App\FincaComcacaot', 'finca_id', 'id');
    }
    public function benefecio(){
        return $this->belongsTo('App\Opcion', 'beneficio', 'id');
    }
    public function fermentacion(){
        return $this->belongsTo('App\Fermentacion', 'fermentacion_id', 'id');
    }
    public function lugarVenta(){
        return $this->belongsTo('App\LugarVenta', 'lugarVenta_id', 'id');
    }
}
