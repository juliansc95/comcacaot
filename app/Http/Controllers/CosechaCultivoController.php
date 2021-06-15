<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\CosechaCultivo;

class CosechaCultivoController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $cosechas= CosechaCultivo::join('componentesocialproductors','cosechacultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','cosechacultivos.productor_id','=','personas.id')
            ->join('fincascoms','cosechacultivos.finca_id','=','fincascoms.id')
            ->join('opcions','cosechacultivos.beneficio','=','opcions.id')
            ->join('fermentacions','cosechacultivos.fermentacion_id','=','fermentacions.id')
            ->join('lugarventas','cosechacultivos.lugarVenta_id','=','lugarventas.id')
            ->select('cosechacultivos.id','cosechacultivos.productor_id','cosechacultivos.finca_id','cosechacultivos.frecuencia',
            'cosechacultivos.frescoTotal','cosechacultivos.secoTotal','cosechacultivos.beneficio','cosechacultivos.fermentacion_id',
            'cosechacultivos.frescoTotalMes','cosechacultivos.secoTotalMes','cosechacultivos.lugarVenta_id',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'opcions.nombre as opcion_benefico','fermentacions.nombre as nombre_fermentacion',
            'lugarventas.nombre as nombre_lugarVenta')
            ->orderBy('cosechacultivos.id','desc')->paginate(3);
        }
        else{
            $cosechas= CosechaCultivo::join('componentesocialproductors','cosechacultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','cosechacultivos.productor_id','=','personas.id')
            ->join('fincascoms','cosechacultivos.finca_id','=','fincascoms.id')
            ->join('opcions','cosechacultivos.beneficio','=','opcions.id')
            ->join('fermentacions','cosechacultivos.fermentacion_id','=','fermentacions.id')
            ->join('lugarventas','cosechacultivos.lugarVenta_id','=','lugarventas.id')
            ->select('cosechacultivos.id','cosechacultivos.productor_id','cosechacultivos.finca_id','cosechacultivos.frecuencia',
            'cosechacultivos.frescoTotal','cosechacultivos.secoTotal','cosechacultivos.beneficio','cosechacultivos.fermentacion_id',
            'cosechacultivos.frescoTotalMes','cosechacultivos.secoTotalMes','cosechacultivos.lugarVenta_id',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'opcions.nombre as opcion_benefico','fermentacions.nombre as nombre_fermentacion',
            'lugarventas.nombre as nombre_lugarVenta')
            ->where('cosechacultivos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('cosechacultivos.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $cosechas->total(),
                'current_page' => $cosechas->currentPage(),
                'per_page'     => $cosechas->perPage(),
                'last_page'    => $cosechas->lastPage(),
                'from'         => $cosechas->firstItem(),
                'to'           => $cosechas->lastItem(),
            ],
            'cosechas' => $cosechas
        ];
    }
    public function store(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $cosecha = new CosechaCultivo();
        $cosecha->productor_id = $request->productor_id; 
        $cosecha->finca_id = $request->finca_id;
        $cosecha->frecuencia = $request->frecuencia;
        $cosecha->frescoTotal = $request->frescoTotal;
        $cosecha->secoTotal = $request->secoTotal; 
        $cosecha->beneficio = $request->beneficio;
        $cosecha->fermentacion_id = $request->fermentacion_id;
        $cosecha->frescoTotalMes = $request->frescoTotalMes;
        $cosecha->secoTotalMes = $request->secoTotalMes;
        $cosecha->lugarVenta_id = $request->lugarVenta_id;
        $cosecha->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        $cosecha =CosechaCultivo::findOrFail($request->id);
        $cosecha->productor_id = $request->productor_id; 
        $cosecha->finca_id = $request->finca_id;
        $cosecha->frecuencia = $request->frecuencia;
        $cosecha->frescoTotal = $request->frescoTotal;
        $cosecha->secoTotal = $request->secoTotal; 
        $cosecha->beneficio = $request->beneficio;
        $cosecha->fermentacion_id = $request->fermentacion_id;
        $cosecha->frescoTotalMes = $request->frescoTotalMes;
        $cosecha->secoTotalMes = $request->secoTotalMes;
        $cosecha->lugarVenta_id = $request->lugarVenta_id;
        $cosecha->save();
    }
}
