<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComponenteSocialProductor extends Model
{
    protected $table = 'componentesocialproductors';
    protected $fillable = ['estadoCivil_id',
    'etnia_id','sexo_id','fechaNacimiento','vereda_id','vivienda_id',
    'tipovivienda_id','escolaridad_id','carnetSalud','discapacitado','personasAcargo',
    'desplazado','asociacion_id','programaEstado_id','asistencia','entidad','capacitacion',
    'temas','parentesco1','NombreP1','ccP1','fechaNacimientoP1','escolaridad_idP1',
    'parentesco2','NombreP2','ccP2','fechaNacimientoP2','escolaridad_idP2',
    'parentesco3','NombreP3','ccP3','fechaNacimientoP3','escolaridad_idP3',
    'parentesco4','NombreP4','ccP4','fechaNacimientoP4','escolaridad_idP4',
    'parentesco5','NombreP5','ccP5','fechaNacimientoP5','escolaridad_idP5',
]; 

    public $timestamps=true;

    public function persona()
    {
        return $this->belongsTo('App\Persona');
    }
    public function estadoCivil()
    {
        return $this->belongsTo('App\EstadoCivil', 'estadoCivil_id', 'id');
    }
    public function etnia(){
        return $this->belongsTo('App\Etnia', 'etnia_id', 'id');
    }
    
    public function sexo(){
        return $this->belongsTo('App\Sexo', 'sexo_id', 'id');
    }
    public function vereda(){
        return $this->belongsTo('App\VeredaCom', 'vereda_id', 'id');
    }
    public function vivienda(){
        return $this->belongsTo('App\Vivienda', 'vivienda_id', 'id');
    }
    public function tipoVivienda(){
        return $this->belongsTo('App\TipoVivienda', 'tipovivienda_id', 'id');
    }
    public function gradoescolaridad(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_id', 'id');
    }
    public function carnetsalud(){
        return $this->belongsTo('App\Opcion', 'carnetSalud', 'id');
    }
    public function discapacitado(){
        return $this->belongsTo('App\Opcion', 'discapacitado', 'id');
    }
    public function asociacion(){
        return $this->belongsTo('App\Asociacion', 'asociacion_id', 'id');
    }
    public function programaEstado(){
        return $this->belongsTo('App\ProgramaEstado', 'programaEstado_id', 'id');
    }
    public function asistencia(){
        return $this->belongsTo('App\Opcion', 'asistencia', 'id');
    }
    public function desplazado(){
        return $this->belongsTo('App\Opcion', 'desplazado', 'id');
    }
    public function capacitacion(){
        return $this->belongsTo('App\Opcion', 'capacitacion', 'id');
    }
    public function parentesco1(){
        return $this->belongsTo('App\Parentesco', 'parentesco1', 'id');
    }
    public function escolaridad1(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_idP1', 'id');
    }
    public function parentesco2(){
        return $this->belongsTo('App\Parentesco', 'parentesco2', 'id');
    }
    public function escolaridad2(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_idP2', 'id');
    }
    public function parentesco3(){
        return $this->belongsTo('App\Parentesco', 'parentesco3', 'id');
    }
    public function escolaridad3(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_idP3', 'id');
    }
    public function parentesco4(){
        return $this->belongsTo('App\Parentesco', 'parentesco4', 'id');
    }
    public function escolaridad4(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_idP4', 'id');
    }
    public function parentesco5(){
        return $this->belongsTo('App\Parentesco', 'parentesco5', 'id');
    }
    public function escolaridad5(){
        return $this->belongsTo('App\GradoEscolaridad', 'escolaridad_idP5', 'id');
    }

}
