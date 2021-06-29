<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Visita;
use App\VisitaCompromiso;

class VisitaController extends Controller
{
    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $visita = new Visita();
        $visita->productor_id = $request->productor_id;
        $visita->finca_id = $request->finca_id;
        $visita->areaProduccion = $request->areaProduccion;
        $visita->siembraNueva = $request->siembra;
        $visita->edadCultivo = $request->edad;
        $visita->arbolesSembrados = $request->numeroArboles;
        $visita->produccionMensual = $request->produccion;
        $visita->vendidoFresco = $request->vendidoFresco;
        $visita->porVenderFresco = $request->porVenderFresco;
        $visita->vendidoSeco = $request->vendidoSeco;
        $visita->porVenderSeco = $request->porVenderSeco;
        $visita->lugarVenta_id = $request->lugarVenta_id;
        $visita->objetivos = $request->objetivos;
        $visita->estadoActualFinca = $request->estadoFinca;
        $visita->recomendacionesTecnicoAmbientales = $request->recomendaciones;
        $visita->observaciones = $request->observaciones;
        $visita->nivelSatisfaccionAsistencia = $request->asistencia;
        $visita->nivelSatisfaccionEmpresa = $request->empresa;
        if($request->predecesor_id){
            $visita->predecesor_id = $request->predecesor_id;
        }
        $visita->save();


        $visitaCompromiso = new visitaCompromiso();
        $visitaCompromiso->visita_id = $visita->id;
        $visitaCompromiso->compromiso = $request->NombreP1;
        $visitaCompromiso->cumplimiento = $request->ccP1;
        $visitaCompromiso->save();

        DB::commit();
            return[
                'id'=>$visita->id
            ];
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function show($id)
    {
        $visita = Visita::find($id);
        $visitaComp = VisitaCompromiso::where('visita_id', '=',$id)->get();
        if (!isset($visita)) {
            return [];
        }
        return ["visita"  => $visita->first(), "compromiso" => $visitaComp ];
    }


}
