<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TiposPodaLaborCultivo extends Model
{
    protected $table = 'tipospodalaborcultivos';
    protected $fillable = ['tipopoda_id','laborcultivo_id'];
    public function tipoPoda(){
        return $this->belongsTo('App\TiposPoda','tipopoda_id','id');
    }
    public function laborCultivo(){
        return $this->belongsTo('App\LaborCultivo','laborcultivo_id','id');
    }
}
