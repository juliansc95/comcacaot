<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\LaborCultivo;

class LaborCultivoController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $labor= LaborCultivo::join('componentesocialproductors','laborcultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','laborcultivos.productor_id','=','personas.id')
            ->join('fincascoms','laborcultivos.finca_id','=','fincascoms.id')
            ->join('opcions AS op3','laborcultivos.control','=','op3.id')
            ->join('tipospodas','laborcultivos.poda_id','=','tipospodas.id')
            ->join('estadocultivos','laborcultivos.estado_id','=','estadocultivos.id')
            ->join('financiacions','laborcultivos.financiacion_id','=','financiacions.id')
            ->join('opcions AS op1','laborcultivos.controlEnfermedades','=','op1.id')
            ->join('tipocontrols AS tp1','laborcultivos.tipoControlEnfermedad','=','tp1.id')
            ->join('opcions AS op2','laborcultivos.controlPlagas','=','op2.id')
            ->join('tipocontrols AS tp2','laborcultivos.tipoControlPlagas','=','tp2.id')
            ->select('laborcultivos.id','laborcultivos.productor_id','laborcultivos.finca_id','laborcultivos.control',
            'laborcultivos.metodo','laborcultivos.observacionMetodo','laborcultivos.poda_id','laborcultivos.observacionPoda',
            'laborcultivos.drenaje','laborcultivos.estado_id','laborcultivos.fertilizacion','laborcultivos.fertilizacionTiempo',
            'laborcultivos.financiacion_id','laborcultivos.frecuenciaFertilizacion','laborcultivos.controlEnfermedades',
            'laborcultivos.tipoControlEnfermedad','laborcultivos.observacionEnfermedad',
            'laborcultivos.controlPlagas','laborcultivos.tipoControlPlagas','laborcultivos.observacionPlaga',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op3.nombre as opcion_control','tipospodas.nombre as nombre_poda',
            'estadocultivos.nombre as nombre_estado','financiacions.nombre as nombre_financiacion',
            'op1.nombre as nombre_controlEnfermedad','tp1.nombre as nombre_tipoControlEnfermedad',
            'op2.nombre as nombre_controlPlaga','tp2.nombre as nombre_tipoControlPlaga')
            ->orderBy('laborcultivos.id','desc')->paginate(10);
        }
        else{
            $labor= LaborCultivo::join('componentesocialproductors','laborcultivos.productor_id','=','componentesocialproductors.id')
            ->join('personas','laborcultivos.productor_id','=','personas.id')
            ->join('fincascoms','laborcultivos.finca_id','=','fincascoms.id')
            ->join('opcions AS op3','laborcultivos.control','=','op3.id')
            ->join('tipospodas','laborcultivos.poda_id','=','tipospodas.id')
            ->join('estadocultivos','laborcultivos.estado_id','=','estadocultivos.id')
            ->join('financiacions','laborcultivos.financiacion_id','=','financiacions.id')
            ->join('opcions AS op1','laborcultivos.controlEnfermedades','=','op1.id')
            ->join('tipocontrols AS tp1','laborcultivos.tipoControlEnfermedad','=','tp1.id')
            ->join('opcions AS op2','laborcultivos.controlPlagas','=','op2.id')
            ->join('tipocontrols AS tp2','laborcultivos.tipoControlPlagas','=','tp2.id')
            ->select('laborcultivos.id','laborcultivos.productor_id','laborcultivos.finca_id','laborcultivos.control',
            'laborcultivos.metodo','laborcultivos.observacionMetodo','laborcultivos.poda_id','laborcultivos.observacionPoda',
            'laborcultivos.drenaje','laborcultivos.estado_id','laborcultivos.fertilizacion','laborcultivos.fertilizacionTiempo',
            'laborcultivos.financiacion_id','laborcultivos.frecuenciaFertilizacion','laborcultivos.controlEnfermedades',
            'laborcultivos.tipoControlEnfermedad','laborcultivos.observacionEnfermedad',
            'laborcultivos.controlPlagas','laborcultivos.tipoControlPlagas','laborcultivos.observacionPlaga',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op3.nombre as opcion_control','tipospodas.nombre as nombre_poda',
            'estadocultivos.nombre as nombre_estado','financiacions.nombre as nombre_financiacion',
            'op1.nombre as nombre_controlEnfermedad','tp1.nombre as nombre_tipoControlEnfermedad',
            'op2.nombre as nombre_controlPlaga','tp2.nombre as nombre_tipoControlPlaga')
            ->where('laborcultivos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('laborcultivos.id', 'desc')->paginate(10);
        }
        return [
            'pagination' => [
                'total'        => $labor->total(),
                'current_page' => $labor->currentPage(),
                'per_page'     => $labor->perPage(),
                'last_page'    => $labor->lastPage(),
                'from'         => $labor->firstItem(),
                'to'           => $labor->lastItem(),
            ],
            'labor' => $labor
        ];
    }
    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();

        $labor = new LaborCultivo();
        $labor->productor_id = $request->productor_id;
        $labor->finca_id = $request->finca_id;
        $labor->control = $request->control;
        $labor->metodo = $request->metodo;
        $labor->observacionMetodo = $request->observacionMetodo;
        $labor->poda_id = $request->poda_id;
        $podas = json_decode($request->podasC, true);//Array de detalles
        //Recorro todos los elementos
        foreach($podas as $poda)
        {
            $newpodas = new MantenimientoAreaCultivo();
            $newpodas -> tipopoda_id = $poda['tipopoda_id'];
            $newpodas -> laborcultivo_id = $poda['laborcultivo_id'];
            $newpodas->save();
        }    
        // $labor->observacionPoda = $request->observacionPoda;
        $labor->drenaje = $request->drenaje;
        $labor->estado_id = $request->estado_id;
        $labor->fertilizacion = $request->fertilizacion;
        $labor->fertilizacionTiempo = $request->fertilizacionTiempo;
        $labor->financiacion_id = $request->financiacion_id;
        $labor->frecuenciaFertilizacion = $request->frecuenciaFertilizacion;
        $labor->controlEnfermedades = $request->controlEnfermedades;
        $labor->tipoControlEnfermedad = $request->tipoControlEnfermedad;
        $labor->observacionEnfermedad = $request->observacionEnfermedad;
        $labor->controlPlagas = $request->controlPlagas;
        $labor->tipoControlPlagas = $request->tipoControlPlagas;
        $labor->observacionPlaga = $request->observacionPlaga;
        $labor->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');

        $labor =LaborCultivo::findOrFail($request->id);
        $labor->productor_id = $request->productor_id;
        $labor->finca_id = $request->finca_id;
        $labor->control = $request->control;
        $labor->metodo = $request->metodo;
        $labor->observacionMetodo = $request->observacionMetodo;
        $labor->poda_id = $request->poda_id;
        $labor->observacionPoda = $request->observacionPoda;
        $labor->drenaje = $request->drenaje;
        $labor->estado_id = $request->estado_id;
        $labor->fertilizacion = $request->fertilizacion;
        $labor->fertilizacionTiempo = $request->fertilizacionTiempo;
        $labor->financiacion_id = $request->financiacion_id;
        $labor->frecuenciaFertilizacion = $request->frecuenciaFertilizacion;
        $labor->controlEnfermedades = $request->controlEnfermedades;
        $labor->tipoControlEnfermedad = $request->tipoControlEnfermedad;
        $labor->observacionEnfermedad = $request->observacionEnfermedad;
        $labor->controlPlagas = $request->controlPlagas;
        $labor->tipoControlPlagas = $request->tipoControlPlagas;
        $labor->observacionPlaga = $request->observacionPlaga;
        $labor->save();
    }
}
