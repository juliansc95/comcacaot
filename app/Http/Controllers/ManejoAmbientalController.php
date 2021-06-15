<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\ManejoAmbiental;

class ManejoAmbientalController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $ambiental= ManejoAmbiental::join('componentesocialproductors','manejoambientals.productor_id','=','componentesocialproductors.id')
            ->join('personas','manejoambientals.productor_id','=','personas.id')
            ->join('fincascoms','manejoambientals.finca_id','=','fincascoms.id')
            ->join('opcions AS op1','manejoambientals.distanciaFuentes','=','op1.id')
            ->join('residuossolidos','manejoambientals.residuo_id','=','residuossolidos.id')
            ->join('opcions AS op2','manejoambientals.erosion','=','op2.id')
            ->join('opcions AS op3','manejoambientals.proteccion','=','op3.id')
            ->join('opcions AS op4','manejoambientals.agroquimico','=','op4.id')
            ->join('opcions AS op5','manejoambientals.fauna','=','op5.id')
            ->select('manejoambientals.id','manejoambientals.productor_id','manejoambientals.finca_id','manejoambientals.distanciaFuentes',
            'manejoambientals.residuo_id','manejoambientals.erosion','manejoambientals.proteccion','manejoambientals.agroquimico',
            'manejoambientals.fauna',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op1.nombre as opcion_fuentes','residuossolidos.nombre as nombre_residuo',
            'op2.nombre as opcion_erosion', 'op3.nombre as opcion_proteccion',
            'op4.nombre as opcion_agroquimico', 'op5.nombre as opcion_fauna')
            ->orderBy('manejoambientals.id','desc')->paginate(3);
        }
        else{
            $ambiental= ManejoAmbiental::join('componentesocialproductors','manejoambientals.productor_id','=','componentesocialproductors.id')
            ->join('personas','manejoambientals.productor_id','=','personas.id')
            ->join('fincascoms','manejoambientals.finca_id','=','fincascoms.id')
            ->join('opcions AS op1','manejoambientals.distanciaFuentes','=','op1.id')
            ->join('residuossolidos','manejoambientals.residuo_id','=','residuossolidos.id')
            ->join('opcions AS op2','manejoambientals.erosion','=','op2.id')
            ->join('opcions AS op3','manejoambientals.proteccion','=','op3.id')
            ->join('opcions AS op4','manejoambientals.agroquimico','=','op4.id')
            ->join('opcions AS op5','manejoambientals.fauna','=','op5.id')
            ->select('manejoambientals.id','manejoambientals.productor_id','manejoambientals.finca_id','manejoambientals.distanciaFuentes',
            'manejoambientals.residuo_id','manejoambientals.erosion','manejoambientals.proteccion','manejoambientals.agroquimico',
            'manejoambientals.fauna',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op1.nombre as opcion_fuentes','residuossolidos.nombre as nombre_residuo',
            'op2.nombre as opcion_erosion', 'op3.nombre as opcion_proteccion',
            'op4.nombre as opcion_agroquimico', 'op5.nombre as opcion_fauna')
            ->where('manejoambientals.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('manejoambientals.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $ambiental->total(),
                'current_page' => $ambiental->currentPage(),
                'per_page'     => $ambiental->perPage(),
                'last_page'    => $ambiental->lastPage(),
                'from'         => $ambiental->firstItem(),
                'to'           => $ambiental->lastItem(),
            ],
            'ambiental' => $ambiental
        ];
    }
    public function store(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $ambiental = new ManejoAmbiental();
        $ambiental->productor_id = $request->productor_id; 
        $ambiental->finca_id = $request->finca_id;
        $ambiental->distanciaFuentes = $request->distanciaFuentes;
        $ambiental->residuo_id = $request->residuo_id;
        $ambiental->erosion = $request->erosion; 
        $ambiental->proteccion = $request->proteccion;
        $ambiental->agroquimico = $request->agroquimico;
        $ambiental->fauna = $request->fauna;
        $ambiental->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        $ambiental =ManejoAmbiental::findOrFail($request->id);
        $ambiental->productor_id = $request->productor_id; 
        $ambiental->finca_id = $request->finca_id;
        $ambiental->distanciaFuentes = $request->distanciaFuentes;
        $ambiental->residuo_id = $request->residuo_id;
        $ambiental->erosion = $request->erosion; 
        $ambiental->proteccion = $request->proteccion;
        $ambiental->agroquimico = $request->agroquimico;
        $ambiental->fauna = $request->fauna;
        $ambiental->save();
    }
}
