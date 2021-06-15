<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ManejoAmbiental extends Model
{
    protected $table = 'manejoambientals';
    protected $fillable = [
    'productor_id','finca_id','distanciaFuentes','residuo_id','erosion',
    'proteccion','agroquimico','fauna'
    ]; 

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function finca()
    {
        return $this->belongsTo('App\FincaComcacaot', 'finca_id', 'id');
    }
    public function distanciaFuentes(){
        return $this->belongsTo('App\Opcion', 'distanciaFuentes', 'id');
    }
    public function residuo(){
        return $this->belongsTo('App\ResiduosSolido', 'residuo_id', 'id');
    }
    public function erosion(){
        return $this->belongsTo('App\Opcion', 'erosion', 'id');
    }
    public function proteccion(){
        return $this->belongsTo('App\Opcion', 'proteccion', 'id');
    }
    public function agroquimico(){
        return $this->belongsTo('App\Opcion', 'agroquimico', 'id');
    }
    public function fauna(){
        return $this->belongsTo('App\Opcion', 'fauna', 'id');
    }
   
}
