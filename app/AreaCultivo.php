<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AreaCultivo extends Model
{
    protected $table = 'areacultivos';
    protected $fillable = [
    'productor_id','finca_id','areaTotalCultivo','edadCultivo','criollo',
    'CCN51','ICS95','otros','injertado','variedadcriollo','variedadCCN51','variedadICS95',
    'variedadotros','arbolesProduccion','estado_id','mantenimiento_id'
    ]; 

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function finca()
    {
        return $this->belongsTo('App\FincaComcacaot', 'finca_id', 'id');
    }
    public function injertado(){
        return $this->belongsTo('App\Opcion', 'injertado', 'id');
    }
    public function estado(){
        return $this->belongsTo('App\EstadoCultivo', 'estado_id', 'id');
    }
    public function mantenimiento(){
        return $this->belongsTo('App\MantenimientoPlantacion', 'mantenimiento_id', 'id');
    }

}
