<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LaborCultivo extends Model
{
    protected $table = 'laborcultivos';
    protected $fillable = [
    'productor_id','finca_id','control','metodo','observacionMetodo',
    'poda_id','observacionPoda','drenaje','estado_id','fertilizacion','fertilizacionTiempo','financiacion_id',
    'frecuenciaFertilizacion','controlEnfermedades','tipoControlEnfermedad','observacionEnfermedad',
    'controlPlagas','tipoControlPlagas','observacionPlaga'
    ]; 

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function finca()
    {
        return $this->belongsTo('App\FincaComcacaot', 'finca_id', 'id');
    }
    public function control(){
        return $this->belongsTo('App\Opcion', 'control', 'id');
    }
    public function poda(){
        return $this->belongsTo('App\TiposPoda', 'poda_id', 'id');
    }
    public function estado(){
        return $this->belongsTo('App\EstadoCultivo', 'estado_id', 'id');
    }
    public function enfermedades(){
        return $this->belongsTo('App\Opcion', 'enfermedades', 'id');
    }
    public function controlEnfermedades(){
        return $this->belongsTo('App\TipoControl', 'tipoControlEnfermedad', 'id');
    }
    public function plagas(){
        return $this->belongsTo('App\Opcion', 'controlPlagas', 'id');
    }
    public function controlPlagas(){
        return $this->belongsTo('App\TipTipoControl', 'tipoControlPlagas', 'id');
    }

}
