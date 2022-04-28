<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Registro;
use App\Persona;

class RegistroController extends Controller
{
    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');
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

            $registro = new Registro();
            $registro->socio = $request->socio;
            $registro->zona_id = $request->zona_id;
            $registro->id = $persona->id;
            $registro->save();
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

        $registro= Registro::findOrFail($request->id);    

        $persona = Persona::findOrFail($registro->id);
        
        $persona->nombre = $request->nombre;
        $persona->tipo_id = $request->tipo_id;
        $persona->num_documento = $request->num_documento;
        $persona->direccion = $request->direccion;
        $persona->telefono = $request->telefono;
        $persona->email = $request->email;
        $persona->save();
        

        $registro->socio = $request->socio;
        $registro->zona_id = $request->zona_id;
        $registro->save();
        DB::commit();    


        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function index(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $personas= Registro::join('personas','registros.id','=','personas.id')
            ->join('zonas','registros.zona_id','=','zonas.id')
            ->join('opcions','registros.socio','=','opcions.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento',
            'personas.direccion','personas.telefono','personas.email','registros.zona_id',
            'registros.socio','zonas.nombre as nombre_zona','opcions.nombre as opcion_socio')
            ->orderBy('personas.id','desc')->paginate(10);
        }
        if($criterio == 'usuario'){
            $personas= Registro::join('personas','registros.id','=','personas.id')
            ->join('zonas','registros.zona_id','=','zonas.id')
            ->join('opcions','registros.socio','=','opcions.id')
            ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento',
            'personas.direccion','personas.telefono','personas.email','registros.zona_id',
            'registros.socio','zonas.nombre as nombre_zona','opcions.nombre as opcion_socio')
            ->where('registros.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('personas.id', 'desc')->paginate(10);    
        }
        else{
            // $personas= Registro::join('personas','registros.id','=','personas.id')
            // ->join('roles','users.idrol','=','roles.id')
            // ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento',
            // 'personas.direccion','personas.telefono','personas.email','registros.zona_id','registros.socio')
            // ->where('personas.'.$criterio, 'like', '%'. $buscar . '%')
            // ->orderBy('personas.id', 'desc')->paginate(10);          
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

    public function selectProductor(Request $request){
        //if(!$request->ajax()) return redirect('/');
        $personas= Registro::join('personas','registros.id','=','personas.id')
        ->select('registros.id','personas.nombre')
        ->where('registros.socio','=','1')
        ->orderBy('registros.id','asc')->get();
        return['personas'=>$personas];
    }

    public function getPersona(Request $request){
        //if(!$request->ajax()) return redirect('/');
        $id=$request->id;
        $persona= Persona::join('tipoids','personas.tipo_id','=','tipoids.id')
        ->select('personas.id','personas.nombre','personas.tipo_id','personas.num_documento','personas.direccion',
        'personas.telefono','personas.email','tipoids.nombre as nombre_id')
        ->where('personas.id','=',$id)
        ->orderBy('personas.id','asc')->get();
        return['persona'=>$persona];
    }


   
}
