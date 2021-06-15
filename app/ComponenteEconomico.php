<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComponenteEconomico extends Model
{
    protected $table = 'componenteeconomicos';
    protected $fillable = ['productor_id',
    'finca_id','ingresoMensual','gastoMensual','otrosIngresos','ingresoNeto',
    'credito','banco_id','ahorro','ahorro_id','registro','accionista',
    'numeroAcciones','interesadoCompra'
]; 
public function productor(){
    return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
}
public function finca(){
    return $this->belongsTo('App\FincaComcacaot','finca_id','id');
}

public function credito(){
    return $this->belongsTo('App\Opcion','credito','id');
}
public function banco(){
    return $this->belongsTo('App\Banco','banco_id','id');
}
public function ahorro(){
    return $this->belongsTo('App\Opcion','ahorro','id');
}
public function bancoAhorro(){
    return $this->belongsTo('App\Banco','ahorro_id','id');
}
public function accionista(){
    return $this->belongsTo('App\Opcion','accionista','id');
}
public function interesadoCompra(){
    return $this->belongsTo('App\Opcion','interesadoCompra','id');
}
}
