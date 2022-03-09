<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\AreaCultivo;

class AreaCultivoController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $cultivos= AreaCultivo::join('componentesocialproductors','areacultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','areacultivos.productor_id','=','personas.id')
            ->join('fincascoms','areacultivos.finca_id','=','fincascoms.id')
            ->join('opcions','areacultivos.injertado','=','opcions.id')
            ->join('estadocultivos','areacultivos.estado_id','=','estadocultivos.id')
            ->join('mantenimientoplantacions','areacultivos.mantenimiento_id','=','mantenimientoplantacions.id')
            ->select('areacultivos.id','areacultivos.productor_id','areacultivos.finca_id','areacultivos.areaTotalCultivo',
            'areacultivos.edadCultivo','areacultivos.criollo','areacultivos.CCN51','areacultivos.ICS95','areacultivos.otros',
            'areacultivos.injertado','areacultivos.variedadCriollo','areacultivos.variedadCCN51','areacultivos.variedadICS95',
            'areacultivos.variedadotros','areacultivos.arbolesProduccion','areacultivos.estado_id','areacultivos.mantenimiento_id',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'opcions.nombre as opcion_injertado','estadocultivos.nombre as nombre_estado',
            'mantenimientoplantacions.nombre as nombre_mantenimiento')
            ->orderBy('areacultivos.id','desc')->paginate(10);
        }
        else{
            $cultivos= AreaCultivo::join('componentesocialproductors','areacultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','areacultivos.productor_id','=','personas.id')
            ->join('fincascoms','areacultivos.finca_id','=','fincascoms.id')
            ->join('opcions','areacultivos.injertado','=','opcions.id')
            ->join('estadocultivos','areacultivos.estado_id','=','estadocultivos.id')
            ->join('mantenimientoplantacions','areacultivos.mantenimiento_id','=','mantenimientoplantacions.id')
            ->select('areacultivos.id','areacultivos.productor_id','areacultivos.finca_id','areacultivos.areaTotalCultivo',
            'areacultivos.edadCultivo','areacultivos.criollo','areacultivos.CCN51','areacultivos.ICS95','areacultivos.otros',
            'areacultivos.injertado','areacultivos.variedadcriollo','areacultivos.variedadCCN51','areacultivos.variedadICS95',
            'areacultivos.variedadotros','areacultivos.arbolesProduccion','areacultivos.estado_id','areacultivos.mantenimiento_id',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'opcions.nombre as opcion_injertado','estadocultivos.nombre as nombre_estado',
            'mantenimientoplantacions.nombre as nombre_mantenimiento')
            ->where('areacultivos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('areacultivos.id', 'desc')->paginate(10);
        }
        return [
            'pagination' => [
                'total'        => $cultivos->total(),
                'current_page' => $cultivos->currentPage(),
                'per_page'     => $cultivos->perPage(),
                'last_page'    => $cultivos->lastPage(),
                'from'         => $cultivos->firstItem(),
                'to'           => $cultivos->lastItem(),
            ],
            'cultivos' => $cultivos
        ];
    }
    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();

        $cultivo = new AreaCultivo();
        $cultivo->productor_id = $request->productor_id;
        $cultivo->finca_id = $request->finca_id;
        $cultivo->areaTotalCultivo = $request->areaTotalCultivo;
        $cultivo->edadCultivo = $request->edadCultivo;
        $cultivo->criollo = $request->criollo;
        $cultivo->CCN51 = $request->CCN51;
        $cultivo->ICS95 = $request->ICS95;
        $cultivo->otros = $request->otros;
        $cultivo->injertado = $request->injertado;
        $cultivo->variedadCriollo = $request->variedadCriollo;
        $cultivo->variedadCCN51 = $request->variedadCCN51;
        $cultivo->variedadICS95 = $request->variedadICS95;
        $cultivo->variedadotros = $request->variedadotros;
        $cultivo->arbolesProduccion = $request->arbolesProduccion;
        $cultivo->estado_id = $request->estado_id;
        $cultivo->mantenimiento_id = $request->mantenimiento_id;
        $cultivo->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');

        $cultivo =AreaCultivo::findOrFail($request->id);
        $cultivo->productor_id = $request->productor_id;
        $cultivo->finca_id = $request->finca_id;
        $cultivo->areaTotalCultivo = $request->areaTotalCultivo;
        $cultivo->edadCultivo = $request->edadCultivo;
        $cultivo->criollo = $request->criollo;
        $cultivo->CCN51 = $request->CCN51;
        $cultivo->ICS95 = $request->ICS95;
        $cultivo->otros = $request->otros;
        $cultivo->injertado = $request->injertado;
        $cultivo->variedadCriollo = $request->variedadCriollo;
        $cultivo->variedadCCN51 = $request->variedadCCN51;
        $cultivo->variedadICS95 = $request->variedadICS95;
        $cultivo->variedadotros = $request->variedadotros;
        $cultivo->arbolesProduccion = $request->arbolesProduccion;
        $cultivo->estado_id = $request->estado_id;
        $cultivo->mantenimiento_id = $request->mantenimiento_id;
        $cultivo->save();
    }
}
