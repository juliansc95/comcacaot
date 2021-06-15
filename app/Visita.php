<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Visita extends Model
{
    protected $table = 'ventacoms';
    protected $fillable = ['productor_id','finca_id',
    'areaProduccion','siembraNueva','edadCultivo','arbolesSembrados','produccionMensual',
    'vendidoFresco','porVenderFresco','vendidoSeco','porVenderSeco','lugarVenta_id',
    'objetivos','estadoActualFinca','recomendacionesTecnicoAmbientales','observaciones',
    'nivelSatisfaccionAsistencia','nivelSatisfaccionEmpresa','predecesor_id'
    ];

    public function productor(){
        return $this->belongsTo('App\ComponenteSocialProductor','productor_id','id');
    }
    public function finca(){
        return $this->belongsTo('App\FincaComcacaot','finca_id','id');
    }
    public function lugarVenta(){
        return $this->belongsTo('App\LugarVenta','lugarVenta_id','id');
    }
}
