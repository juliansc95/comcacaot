<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FincaComcacaot extends Model
{
    protected $table = 'fincascoms';
    protected $fillable = ['nombre',
    'productor_id','fechaRegistro','telefono','departamento_id','municipio_id',
    'vereda_id','zona_id','areaTotal','viasAcceso','latitud','longitud','altitud','posesion_id'
    ]; 

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function departamento()
    {
        return $this->belongsTo('App\Departamento', 'departamento_id', 'id');
    }
    public function municipio()
    {
        return $this->belongsTo('App\Municipio', 'municipio_id', 'id');
    }
    public function vereda(){
        return $this->belongsTo('App\VeredaCom', 'vereda_id', 'id');
    }
    public function zona(){
        return $this->belongsTo('App\Zona', 'zona_id', 'id');
    }
    public function posesion(){
        return $this->belongsTo('App\Posesion', 'posesion_id', 'id');
    }
    
}
