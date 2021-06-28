<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\ComponenteSocialProductor;
use App\Persona;
use App\User;

class ComponenteSocialProductorController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
            ->join('estadocivils','componentesocialproductors.estadoCivil_id','=','estadocivils.id')
            ->join('etnias','componentesocialproductors.etnia_id','=','etnias.id')
            ->join('sexos','componentesocialproductors.sexo_id','=','sexos.id')
            ->join('veredascoms','componentesocialproductors.vereda_id','=','veredascoms.id')
            ->join('zonas','componentesocialproductors.zona_id','=','zonas.id')
            ->join('viviendas','componentesocialproductors.vivienda_id','=','viviendas.id')
            ->join('tipoviviendas','componentesocialproductors.tipovivienda_id','=','tipoviviendas.id')
            ->join('gradoescolaridads','componentesocialproductors.escolaridad_id','=','gradoescolaridads.id')
            ->join('opcions AS op1','componentesocialproductors.carnetSalud','=','op1.id')
            ->join('opcions AS op2','componentesocialproductors.discapacitado','=','op2.id')
            ->join('opcions AS op3','componentesocialproductors.desplazado','=','op3.id')
            ->join('opcions AS op4','componentesocialproductors.asistencia','=','op4.id')
            ->join('opcions AS op5','componentesocialproductors.capacitacion','=','op5.id')
            ->join('asociacions','componentesocialproductors.asociacion_id','=','asociacions.id')
            ->join('programaestados','componentesocialproductors.programaEstado_id','=','programaestados.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento','personas.telefono','personas.email',
            'componentesocialproductors.estadoCivil_id','estadocivils.nombre as estadocivil_nombre',
            'componentesocialproductors.etnia_id','etnias.nombre as nombre_etnia',
            'componentesocialproductors.sexo_id','sexos.nombre as nombre_sexo',
            'componentesocialproductors.fechaNacimiento',
            'componentesocialproductors.vereda_id','veredascoms.nombre as nombre_vereda',
            'componentesocialproductors.zona_id','zonas.nombre as nombre_zona',
            'componentesocialproductors.vivienda_id','viviendas.nombre as nombre_vivienda',
            'componentesocialproductors.tipovivienda_id','tipoviviendas.nombre as nombre_tipoVivienda',
            'componentesocialproductors.escolaridad_id','gradoescolaridads.nombre as nombre_escolaridad',
            'componentesocialproductors.carnetSalud','op1.nombre as opcion_salud',
            'componentesocialproductors.discapacitado','op2.nombre as opcion_discapacitado',
            'componentesocialproductors.personasAcargo',
            'componentesocialproductors.desplazado','op3.nombre as opcion_desplazado',
            'componentesocialproductors.asociacion_id','asociacions.nombre as nombre_asociacion',
            'componentesocialproductors.programaEstado_id','programaestados.nombre as nombre_programa',
            'componentesocialproductors.asistencia','op4.nombre as opcion_asistencia',
            'componentesocialproductors.entidad',
            'componentesocialproductors.capacitacion','op5.nombre as opcion_capacitacion',
            'componentesocialproductors.temas',
            )
            ->orderBy('componentesocialproductors.id','desc')->paginate(3);
        }
        else{
            $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
            ->join('estadocivils','componentesocialproductors.estadoCivil_id','=','estadocivils.id')
            ->join('etnias','componentesocialproductors.etnia_id','=','etnias.id')
            ->join('sexos','componentesocialproductors.sexo_id','=','sexos.id')
            ->join('veredascoms','componentesocialproductors.vereda_id','=','veredascoms.id')
            ->join('zonas','componentesocialproductors.zona_id','=','zonas.id')
            ->join('viviendas','componentesocialproductors.vivienda_id','=','viviendas.id')
            ->join('tipoviviendas','componentesocialproductors.tipovivienda_id','=','tipoviviendas.id')
            ->join('gradoescolaridads','componentesocialproductors.escolaridad_id','=','gradoescolaridads.id')
            ->join('opcions AS op1','componentesocialproductors.carnetSalud','=','op1.id')
            ->join('opcions AS op2','componentesocialproductors.discapacitado','=','op2.id')
            ->join('opcions AS op3','componentesocialproductors.desplazado','=','op3.id')
            ->join('opcions AS op4','componentesocialproductors.asistencia','=','op4.id')
            ->join('opcions AS op5','componentesocialproductors.capacitacion','=','op5.id')
            ->join('asociacions','componentesocialproductors.asociacion_id','=','asociacions.id')
            ->join('programaestados','componentesocialproductors.programaEstado_id','=','programaestados.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento','personas.telefono','personas.email',
            'componentesocialproductors.estadoCivil_id','estadocivils.nombre as estadocivil_nombre',
            'componentesocialproductors.etnia_id','etnias.nombre as nombre_etnia',
            'componentesocialproductors.sexo_id','sexos.nombre as nombre_sexo',
            'componentesocialproductors.fechaNacimiento',
            'componentesocialproductors.vereda_id','veredascoms.nombre as nombre_vereda',
            'componentesocialproductors.zona_id','zonas.nombre as nombre_zona',
            'componentesocialproductors.vivienda_id','viviendas.nombre as nombre_vivienda',
            'componentesocialproductors.tipovivienda_id','tipoviviendas.nombre as nombre_tipoVivienda',
            'componentesocialproductors.escolaridad_id','gradoescolaridads.nombre as nombre_escolaridad',
            'componentesocialproductors.carnetSalud','op1.nombre as opcion_salud',
            'componentesocialproductors.discapacitado','op2.nombre as opcion_discapacitado',
            'componentesocialproductors.personasAcargo',
            'componentesocialproductors.desplazado','op3.nombre as opcion_desplazado',
            'componentesocialproductors.asociacion_id','asociacions.nombre as nombre_asociacion',
            'componentesocialproductors.programaEstado_id','programaestados.nombre as nombre_programa',
            'componentesocialproductors.asistencia','op4.nombre as opcion_asistencia',
            'componentesocialproductors.entidad',
            'componentesocialproductors.capacitacion','op5.nombre as opcion_capacitacion',
            'componentesocialproductors.temas',
            )
            ->where('personas.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('personas.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $personas->total(),
                'current_page' => $personas->currentPage(),
                'per_page'     => $personas->perPage(),
                'last_page'    => $personas->lastPage(),
                'from'         => $personas->firstItem(),
                'to'           => $personas->lastItem(),
            ],
            'personas' => $personas
        ];
    }

    public function index2(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
            ->join('estadocivils','componentesocialproductors.estadoCivil_id','=','estadocivils.id')
            ->join('etnias','componentesocialproductors.etnia_id','=','etnias.id')
            ->join('sexos','componentesocialproductors.sexo_id','=','sexos.id')
            ->join('veredascoms','componentesocialproductors.vereda_id','=','veredascoms.id')
            ->join('zonas','componentesocialproductors.zona_id','=','zonas.id')
            ->join('viviendas','componentesocialproductors.vivienda_id','=','viviendas.id')
            ->join('tipoviviendas','componentesocialproductors.tipovivienda_id','=','tipoviviendas.id')
            ->join('gradoescolaridads','componentesocialproductors.escolaridad_id','=','gradoescolaridads.id')
            ->join('opcions AS op1','componentesocialproductors.carnetSalud','=','op1.id')
            ->join('opcions AS op2','componentesocialproductors.discapacitado','=','op2.id')
            ->join('opcions AS op3','componentesocialproductors.desplazado','=','op3.id')
            ->join('opcions AS op4','componentesocialproductors.asistencia','=','op4.id')
            ->join('opcions AS op5','componentesocialproductors.capacitacion','=','op5.id')
            ->join('asociacions','componentesocialproductors.asociacion_id','=','asociacions.id')
            ->join('programaestados','componentesocialproductors.programaEstado_id','=','programaestados.id')
            ->join('parentescos AS p1','componentesocialproductors.parentesco1','=','p1.id')
            ->join('gradoescolaridads AS escolaridadP1','componentesocialproductors.escolaridad_idP1','=','escolaridadP1.id')
            ->join('parentescos AS p2','componentesocialproductors.parentesco2','=','p2.id')
            ->join('gradoescolaridads AS escolaridadP2','componentesocialproductors.escolaridad_idP2','=','escolaridadP2.id')
            ->join('parentescos AS p3','componentesocialproductors.parentesco3','=','p3.id')
            ->join('gradoescolaridads AS escolaridadP3','componentesocialproductors.escolaridad_idP3','=','escolaridadP3.id')
            ->join('parentescos AS p4','componentesocialproductors.parentesco4','=','p4.id')
            ->join('gradoescolaridads AS escolaridadP4','componentesocialproductors.escolaridad_idP4','=','escolaridadP4.id')
            ->join('parentescos AS p5','componentesocialproductors.parentesco5','=','p5.id')
            ->join('gradoescolaridads AS escolaridadP5','componentesocialproductors.escolaridad_idP5','=','escolaridadP5.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento','personas.telefono','personas.email',
            'componentesocialproductors.estadoCivil_id','estadocivils.nombre as estadocivil_nombre',
            'componentesocialproductors.etnia_id','etnias.nombre as nombre_etnia',
            'componentesocialproductors.sexo_id','sexos.nombre as nombre_sexo',
            'componentesocialproductors.fechaNacimiento',
            'componentesocialproductors.vereda_id','veredascoms.nombre as nombre_vereda',
            'componentesocialproductors.zona_id','zonas.nombre as nombre_zona',
            'componentesocialproductors.vivienda_id','viviendas.nombre as nombre_vivienda',
            'componentesocialproductors.tipovivienda_id','tipoviviendas.nombre as nombre_tipoVivienda',
            'componentesocialproductors.escolaridad_id','gradoescolaridads.nombre as nombre_escolaridad',
            'componentesocialproductors.carnetSalud','op1.nombre as opcion_salud',
            'componentesocialproductors.discapacitado','op2.nombre as opcion_discapacitado',
            'componentesocialproductors.personasAcargo',
            'componentesocialproductors.desplazado','op3.nombre as opcion_desplazado',
            'componentesocialproductors.asociacion_id','asociacions.nombre as nombre_asociacion',
            'componentesocialproductors.programaEstado_id','programaestados.nombre as nombre_programa',
            'componentesocialproductors.asistencia','op4.nombre as opcion_asistencia',
            'componentesocialproductors.entidad',
            'componentesocialproductors.capacitacion','op5.nombre as opcion_capacitacion',
            'componentesocialproductors.temas',
            'componentesocialproductors.parentesco1','p1.nombre as nombre_parentesco1',
            'componentesocialproductors.NombreP1','componentesocialproductors.ccP1',
            'componentesocialproductors.fechaNacimientoP1',
            'componentesocialproductors.escolaridad_idP1','escolaridadP1.nombre as nombre_escolaridadP1',

            'componentesocialproductors.parentesco2','p2.nombre as nombre_parentesco2',
            'componentesocialproductors.NombreP2','componentesocialproductors.ccP2',
            'componentesocialproductors.fechaNacimientoP2',
            'componentesocialproductors.escolaridad_idP2','escolaridadP2.nombre as nombre_escolaridadP2',

            'componentesocialproductors.parentesco3','p3.nombre as nombre_parentesco3',
            'componentesocialproductors.NombreP3','componentesocialproductors.ccP3',
            'componentesocialproductors.fechaNacimientoP3',
            'componentesocialproductors.escolaridad_idP3','escolaridadP3.nombre as nombre_escolaridadP3',

            'componentesocialproductors.parentesco4','p4.nombre as nombre_parentesco4',
            'componentesocialproductors.NombreP4','componentesocialproductors.ccP4',
            'componentesocialproductors.fechaNacimientoP4',
            'componentesocialproductors.escolaridad_idP4','escolaridadP4.nombre as nombre_escolaridadP4',

            'componentesocialproductors.parentesco5','p5.nombre as nombre_parentesco5',
            'componentesocialproductors.NombreP5','componentesocialproductors.ccP5',
            'componentesocialproductors.fechaNacimientoP5',
            'componentesocialproductors.escolaridad_idP5','escolaridadP5.nombre as nombre_escolaridadP5',

            )
            ->orderBy('componentesocialproductors.id','asc')->paginate(3);
        }
        else{
            $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
            ->join('estadocivils','componentesocialproductors.estadoCivil_id','=','estadocivils.id')
            ->join('etnias','componentesocialproductors.etnia_id','=','etnias.id')
            ->join('sexos','componentesocialproductors.sexo_id','=','sexos.id')
            ->join('veredascoms','componentesocialproductors.vereda_id','=','veredascoms.id')
            ->join('zonas','componentesocialproductors.zona_id','=','zonas.id')
            ->join('viviendas','componentesocialproductors.vivienda_id','=','viviendas.id')
            ->join('tipoviviendas','componentesocialproductors.tipovivienda_id','=','tipoviviendas.id')
            ->join('gradoescolaridads','componentesocialproductors.escolaridad_id','=','gradoescolaridads.id')
            ->join('opcions AS op1','componentesocialproductors.carnetSalud','=','op1.id')
            ->join('opcions AS op2','componentesocialproductors.discapacitado','=','op2.id')
            ->join('opcions AS op3','componentesocialproductors.desplazado','=','op3.id')
            ->join('opcions AS op4','componentesocialproductors.asistencia','=','op4.id')
            ->join('opcions AS op5','componentesocialproductors.capacitacion','=','op5.id')
            ->join('asociacions','componentesocialproductors.asociacion_id','=','asociacions.id')
            ->join('programaestados','componentesocialproductors.programaEstado_id','=','programaestados.id')
            ->join('parentescos AS p1','componentesocialproductors.parentesco1','=','p1.id')
            ->join('gradoescolaridads AS escolaridadP1','componentesocialproductors.escolaridad_idP1','=','escolaridadP1.id')
            ->join('parentescos AS p2','componentesocialproductors.parentesco2','=','p2.id')
            ->join('gradoescolaridads AS escolaridadP2','componentesocialproductors.escolaridad_idP2','=','escolaridadP2.id')
            ->join('parentescos AS p3','componentesocialproductors.parentesco3','=','p3.id')
            ->join('gradoescolaridads AS escolaridadP3','componentesocialproductors.escolaridad_idP3','=','escolaridadP3.id')
            ->join('parentescos AS p4','componentesocialproductors.parentesco4','=','p4.id')
            ->join('gradoescolaridads AS escolaridadP4','componentesocialproductors.escolaridad_idP4','=','escolaridadP4.id')
            ->join('parentescos AS p5','componentesocialproductors.parentesco5','=','p5.id')
            ->join('gradoescolaridads AS escolaridadP5','componentesocialproductors.escolaridad_idP5','=','escolaridadP5.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento','personas.telefono','personas.email',
            'componentesocialproductors.estadoCivil_id','estadocivils.nombre as estadocivil_nombre',
            'componentesocialproductors.etnia_id','etnias.nombre as nombre_etnia',
            'componentesocialproductors.sexo_id','sexos.nombre as nombre_sexo',
            'componentesocialproductors.fechaNacimiento',
            'componentesocialproductors.vereda_id','veredascoms.nombre as nombre_vereda',
            'componentesocialproductors.zona_id','zonas.nombre as nombre_zona',
            'componentesocialproductors.vivienda_id','viviendas.nombre as nombre_vivienda',
            'componentesocialproductors.tipovivienda_id','tipoviviendas.nombre as nombre_tipoVivienda',
            'componentesocialproductors.escolaridad_id','gradoescolaridads.nombre as nombre_escolaridad',
            'componentesocialproductors.carnetSalud','op1.nombre as opcion_salud',
            'componentesocialproductors.discapacitado','op2.nombre as opcion_discapacitado',
            'componentesocialproductors.personasAcargo',
            'componentesocialproductors.desplazado','op3.nombre as opcion_desplazado',
            'componentesocialproductors.asociacion_id','asociacions.nombre as nombre_asociacion',
            'componentesocialproductors.programaEstado_id','programaestados.nombre as nombre_programa',
            'componentesocialproductors.asistencia','op4.nombre as opcion_asistencia',
            'componentesocialproductors.entidad',
            'componentesocialproductors.capacitacion','op5.nombre as opcion_capacitacion',
            'componentesocialproductors.temas',
            'componentesocialproductors.parentesco1','p1.nombre as nombre_parentesco1',
            'componentesocialproductors.NombreP1','componentesocialproductors.ccP1',
            'componentesocialproductors.fechaNacimientoP1',
            'componentesocialproductors.escolaridad_idP1','escolaridadP1.nombre as nombre_escolaridadP1',

            'componentesocialproductors.parentesco2','p2.nombre as nombre_parentesco2',
            'componentesocialproductors.NombreP2','componentesocialproductors.ccP2',
            'componentesocialproductors.fechaNacimientoP2',
            'componentesocialproductors.escolaridad_idP2','escolaridadP2.nombre as nombre_escolaridadP2',

            'componentesocialproductors.parentesco3','p3.nombre as nombre_parentesco3',
            'componentesocialproductors.NombreP3','componentesocialproductors.ccP3',
            'componentesocialproductors.fechaNacimientoP3',
            'componentesocialproductors.escolaridad_idP3','escolaridadP3.nombre as nombre_escolaridadP3',

            'componentesocialproductors.parentesco4','p4.nombre as nombre_parentesco4',
            'componentesocialproductors.NombreP4','componentesocialproductors.ccP4',
            'componentesocialproductors.fechaNacimientoP4',
            'componentesocialproductors.escolaridad_idP4','escolaridadP4.nombre as nombre_escolaridadP4',

            'componentesocialproductors.parentesco5','p5.nombre as nombre_parentesco5',
            'componentesocialproductors.NombreP5','componentesocialproductors.ccP5',
            'componentesocialproductors.fechaNacimientoP5',
            'componentesocialproductors.escolaridad_idP5','escolaridadP5.nombre as nombre_escolaridadP5',

            )
            ->where('personas.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('personas.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $personas->total(),
                'current_page' => $personas->currentPage(),
                'per_page'     => $personas->perPage(),
                'last_page'    => $personas->lastPage(),
                'from'         => $personas->firstItem(),
                'to'           => $personas->lastItem(),
            ],
            'personas' => $personas
        ];
    }

    public function store(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $persona = new Persona();
            $persona->nombre = $request->nombre;
            $persona->tipo_id = $request->tipo_id;
            $persona->num_documento = $request->num_documento;
            $persona->direccion = $request->direccion;
            $persona->telefono = $request->telefono;
            $persona->email = $request->email;
            $persona->save();

          
            $nacimiento= Carbon::parse($request->fechaNacimiento)->toDateString();
            $nacimientoP1= Carbon::parse($request->fechaNacimientoP1)->toDateString();
            $nacimientoP2= Carbon::parse($request->fechaNacimientoP2)->toDateString();
            $nacimientoP3= Carbon::parse($request->fechaNacimientoP3)->toDateString();
            $nacimientoP4= Carbon::parse($request->fechaNacimientoP4)->toDateString();
            $nacimientoP5= Carbon::parse($request->fechaNacimientoP5)->toDateString();
           
            $productor = new ComponenteSocialProductor();
            $productor->estadoCivil_id = $request->estadoCivil_id;
            $productor->etnia_id = $request->etnia_id;
            $productor->sexo_id = $request->sexo_id;
            $productor->fechaNacimiento = $nacimiento;
            $productor->vereda_id = $request->vereda_id;
            $productor->zona_id = $request->zona_id;
            $productor->vivienda_id = $request->vivienda_id;
            $productor->tipovivienda_id = $request->tipovivienda_id;
            $productor->escolaridad_id = $request->escolaridad_id;
            $productor->carnetSalud = $request->carnetSalud;
            $productor->discapacitado = $request->discapacitado;
            $productor->personasAcargo = $request->personasAcargo;
            $productor->desplazado = $request->desplazado;
            $productor->asociacion_id = $request->asociacion_id;
            $productor->programaEstado_id = $request->programaEstado_id;
            $productor->asistencia = $request->asistencia;
            $productor->entidad = $request->entidad;
            $productor->capacitacion = $request->capacitacion;
            $productor->temas = $request->temas;
            $productor->parentesco1 = $request->parentesco1;
            $productor->NombreP1 = $request->NombreP1;
            $productor->ccP1 = $request->ccP1;
            $productor->fechaNacimientoP1 = $nacimientoP1;
            $productor->escolaridad_idP1 = $request->escolaridad_idP1;

            $productor->parentesco2 = $request->parentesco2;
            $productor->NombreP2 = $request->NombreP2;
            $productor->ccP2 = $request->ccP2;
            $productor->fechaNacimientoP2 = $nacimientoP2;
            $productor->escolaridad_idP2 = $request->escolaridad_idP2;

            $productor->parentesco3 = $request->parentesco3;
            $productor->NombreP3 = $request->NombreP3;
            $productor->ccP3 = $request->ccP3;
            $productor->fechaNacimientoP3 = $nacimientoP3;
            $productor->escolaridad_idP3 = $request->escolaridad_idP3;

            $productor->parentesco4 = $request->parentesco4;
            $productor->NombreP4 = $request->NombreP4;
            $productor->ccP4 = $request->ccP4;
            $productor->fechaNacimientoP4 = $nacimientoP4;
            $productor->escolaridad_idP4 = $request->escolaridad_idP4;

            $productor->parentesco5 = $request->parentesco5;
            $productor->NombreP5 = $request->NombreP5;
            $productor->ccP5 = $request->ccP5;
            $productor->fechaNacimientoP5 = $nacimientoP5;
            $productor->escolaridad_idP5 = $request->escolaridad_idP5;
            $productor->id = $persona->id; 
            $productor->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $productor =ComponenteSocialProductor::findOrFail($request->id);
        $persona =Persona::findorFail($productor->id);
        
        $persona->nombre = $request->nombre;
        $persona->tipo_id = $request->tipo_id;
        $persona->num_documento = $request->num_documento;
        $persona->direccion = $request->direccion;
        $persona->telefono = $request->telefono;
        $persona->email = $request->email;
        $persona->save(); 

        $nacimiento= Carbon::parse($request->fechaNacimiento)->toDateString();
        $nacimientoP1= Carbon::parse($request->fechaNacimientoP1)->toDateString();
        $nacimientoP2= Carbon::parse($request->fechaNacimientoP2)->toDateString();
        $nacimientoP3= Carbon::parse($request->fechaNacimientoP3)->toDateString();
        $nacimientoP4= Carbon::parse($request->fechaNacimientoP4)->toDateString();
        $nacimientoP5= Carbon::parse($request->fechaNacimientoP5)->toDateString();
       
        $productor = new ComponenteSocialProductor();
        $productor->estadoCivil_id = $request->estadoCivil_id;
        $productor->etnia_id = $request->etnia_id;
        $productor->sexo_id = $request->sexo_id;
        $productor->fechaNacimiento = $nacimiento;
        $productor->vereda_id = $request->vereda_id;
        $productor->zona_id = $request->zona_id;
        $productor->vivienda_id = $request->vivienda_id;
        $productor->tipovivienda_id = $request->tipovivienda_id;
        $productor->escolaridad_id = $request->escolaridad_id;
        $productor->carnetSalud = $request->carnetSalud;
        $productor->discapacitado = $request->discapacitado;
        $productor->personasAcargo = $request->personasAcargo;
        $productor->desplazado = $request->desplazado;
        $productor->asociacion_id = $request->asociacion_id;
        $productor->programaEstado_id = $request->programaEstado_id;
        $productor->asistencia = $request->asistencia;
        $productor->entidad = $request->entidad;
        $productor->capacitacion = $request->capacitacion;
        $productor->temas = $request->temas;
        $productor->parentesco1 = $request->parentesco1;
        $productor->NombreP1 = $request->NombreP1;
        $productor->ccP1 = $request->ccP1;
        $productor->fechaNacimientoP1 = $nacimientoP1;
        $productor->escolaridad_idP1 = $request->escolaridad_idP1;

        $productor->parentesco2 = $request->parentesco2;
        $productor->NombreP2 = $request->NombreP2;
        $productor->ccP2 = $request->ccP2;
        $productor->fechaNacimientoP2 = $nacimientoP2;
        $productor->escolaridad_idP2 = $request->escolaridad_idP2;

        $productor->parentesco3 = $request->parentesco3;
        $productor->NombreP3 = $request->NombreP3;
        $productor->ccP3 = $request->ccP3;
        $productor->fechaNacimientoP3 = $nacimientoP3;
        $productor->escolaridad_idP3 = $request->escolaridad_idP3;

        $productor->parentesco4 = $request->parentesco4;
        $productor->NombreP4 = $request->NombreP4;
        $productor->ccP4 = $request->ccP4;
        $productor->fechaNacimientoP4 = $nacimientoP4;
        $productor->escolaridad_idP4 = $request->escolaridad_idP4;

        $productor->parentesco5 = $request->parentesco5;
        $productor->NombreP5 = $request->NombreP5;
        $productor->ccP5 = $request->ccP5;
        $productor->fechaNacimientoP5 = $nacimientoP5;
        $productor->escolaridad_idP5 = $request->escolaridad_idP5;
        $productor->save();
        DB::commit();
        }
        catch(Exception $e){
            DB::rollback();
        }  
    }

    public function selectProductor(Request $request){
        if(!$request->ajax()) return redirect('/');
        $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
        ->select('componentesocialproductors.id','personas.nombre')->orderBy('componentesocialproductors.id','asc')->get();
        return['personas'=>$personas];
    }  

    public function selectProductor2(Request $request){
        if(!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
        ->where('personas.nombre', 'like', '%'. $filtro . '%')
        ->orWhere('personas.num_documento', 'like', '%'. $filtro . '%')
        ->select('componentesocialproductors.id','personas.nombre','personas.num_documento')
        ->orderBy('personas.nombre', 'asc')->get();
        return['personas'=>$personas];
    }  
}
