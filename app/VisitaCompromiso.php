<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VisitaCompromiso extends Model
{
    protected $table = 'visita_compromisos';
    protected $fillable = ['visita_id','compromiso',
    'cumplimiento','predecesor_id'
    ];

    public function visita(){
        return $this->belongsTo('App\Visita','visita_id','id');
    }

}
