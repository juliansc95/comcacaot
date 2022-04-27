<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MantenimientoAreaCultivo extends Model
{
    protected $table = 'mantenimientoareacultivos';
    protected $fillable = ['manteninimiento_id','areacultivo_id'];
    public function mantenimiento(){
        return $this->belongsTo('App\MantenimientoPlantacion','manteninimiento_id','id');
    }
    public function areaCultivo(){
        return $this->belongsTo('App\AreaCultivo','areacultivo_id','id');
    }
}
