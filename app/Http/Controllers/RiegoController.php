<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Riego;


class RiegoController extends Controller
{
    public function index(Request $request)
    {
    if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $riegos= Riego::join('personas','riegos.productor_id','=','personas.id')
            ->join('productors','riegos.productor_id','=','productors.id')
            ->join('fincas','riegos.finca_id','=','fincas.id')
            ->select('personas.nombre','riegos.productor_id','riegos.finca_id','fincas.nombre as nombre_finca',
            'riegos.riego','riegos.adquisicion','riegos.frecuencia','riegos.tipo','riegos.tiempo','riegos.jornales')
            ->orderBy('riegos.id','desc')->paginate(3);
        }
        if($criterio == 'personas'){
            $riegos= Riego::join('personas','riegos.productor_id','=','personas.id')
            ->join('productors','riegos.productor_id','=','productors.id')
            ->join('fincas','riegos.finca_id','=','fincas.id')
            ->select('personas.nombre','riegos.productor_id','riegos.finca_id','fincas.nombre as nombre_finca',
            'riegos.riego','riegos.adquisicion','riegos.frecuencia','riegos.tipo','riegos.tiempo','riegos.jornales')
            ->where($criterio.'.nombre', 'like', '%'. $buscar . '%')
            ->orderBy('riegos.id', 'asc')->paginate(3);
            }
        else{
            $riegos= Riego::join('personas','riegos.productor_id','=','personas.id')
            ->join('productors','riegos.productor_id','=','productors.id')
            ->join('fincas','riegos.finca_id','=','fincas.id')
            ->select('personas.nombre','riegos.productor_id','riegos.finca_id','fincas.nombre as nombre_finca',
            'riegos.riego','riegos.adquisicion','riegos.frecuencia','riegos.tipo','riegos.tiempo','riegos.jornales')
            ->where('riegos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('riegos.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $riegos->total(),
                'current_page' => $riegos->currentPage(),
                'per_page'     => $riegos->perPage(),
                'last_page'    => $riegos->lastPage(),
                'from'         => $riegos->firstItem(),
                'to'           => $riegos->lastItem(),
            ],
            'riegos' => $riegos
        ];
    }
    public function store(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $riego = new Riego();
        $riego->productor_id = $request->productor_id;
        $riego->finca_id = $request->finca_id;
        $riego->riego=$request->riego;
        $riego->adquisicion=$request->adquisicion;
        $riego->frecuencia= $request->frecuencia;
        $riego->tipo= $request->tipo;
        $riego->tiempo= $request->tiempo;
        $riego->jornales= $request->jornales;
        $riego->save();
        DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }
}
