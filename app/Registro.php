<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Registro extends Model
{
    protected $table = 'registros';
    protected $fillable = ['socio','zona_id']; 

    public $timestamps=false;

    public function persona()
    {
        return $this->belongsTo('App\Persona');
    }
    public function zona(){
        return $this->belongsTo('App\Zona', 'zona_id', 'id');
    }
    public function socio(){
        return $this->belongsTo('App\Opcion', 'socio', 'id');
    }
}
