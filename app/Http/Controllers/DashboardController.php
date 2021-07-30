<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\ComponenteSocialProductor;
use App\ComponenteEconomico;
use App\AreaCultivo;
use App\LaborCultivo;
use App\CosechaCultivo;
use App\FincaComcacaot;

class DashboardController extends Controller
{
    public function __invoke(Request $request)
    {
        $anio=date('Y');
       
        $ventas=DB::table('ventacoms as v')
        ->select(DB::raw('DATE(v.fechaVenta) as mes'),
        DB::raw('DAY(v.fechaVenta) as anio'),
        DB::raw('SUM(v.totalNeto) as total'))
        ->whereYear('v.fechaVenta',$anio)
        ->groupBy(DB::raw('DATE(v.fechaVenta)'),DB::raw('DAY(v.fechaVenta)'))
        ->get(); 

        $usuarios=DB::table('personas as v')
        ->select(DB::raw('DATE(v.created_at) as mes'),
        DB::raw('DAY(v.created_at) as anio'),
        DB::raw('COUNT(v.id) as total'))
        ->groupBy(DB::raw('DATE(v.created_at)'),DB::raw('DAY(v.created_at)'))
        ->get();

        $estadoCivil=ComponenteSocialProductor::join('estadocivils','componentesocialproductors.estadoCivil_id','=','estadocivils.id')
        ->select( 'estadocivils.nombre as estadocivil_nombre',DB::raw('COUNT(*) as total'))       
        ->groupBy('estadocivils.nombre')
        ->get();

        $etnias=ComponenteSocialProductor::join('etnias','componentesocialproductors.etnia_id','=','etnias.id')
        ->select( 'etnias.nombre as nombre_etnia',DB::raw('COUNT(*) as total'))       
        ->groupBy('etnias.nombre')
        ->get();

        $sexos=ComponenteSocialProductor::join('sexos','componentesocialproductors.sexo_id','=','sexos.id')
        ->select( 'sexos.nombre as nombre_sexo',DB::raw('COUNT(*) as total'))       
        ->groupBy('sexos.nombre')
        ->get();

        $edades=ComponenteSocialProductor::select( DB::raw(' CASE WHEN (YEAR(CURDATE())-YEAR(fechaNacimiento) BETWEEN 0 AND 30) THEN "Menores de 30" ELSE
        CASE WHEN (YEAR(CURDATE())-YEAR(fechaNacimiento) BETWEEN 30 AND 50) THEN "De 30 a 50" ELSE
        CASE WHEN (YEAR(CURDATE())-YEAR(fechaNacimiento) >= 50) THEN "De 50 o mas"
        END
        END
        END rango,
        COUNT(*) total'))       
        ->groupBy('rango')
        ->get();

        $escolaridades=ComponenteSocialProductor::join('gradoescolaridads','componentesocialproductors.escolaridad_id','=','gradoescolaridads.id')
        ->select( 'gradoescolaridads.nombre as nombre_escolaridad',DB::raw('COUNT(*) as total'))       
        ->groupBy('gradoescolaridads.nombre')
        ->get();


        $discapacitados=ComponenteSocialProductor::join('opcions','componentesocialproductors.discapacitado','=','opcions.id')
        ->select( 'opcions.nombre as opcion_discapacitado',DB::raw('COUNT(*) as total'))       
        ->groupBy('opcions.nombre')
        ->get();

        $personasacargo=ComponenteSocialProductor::select( 'personasAcargo',DB::raw('COUNT(*) as total'))       
        ->groupBy('personasAcargo')
        ->get();

        $desplazados=ComponenteSocialProductor::join('opcions','componentesocialproductors.desplazado','=','opcions.id')
        ->select( 'opcions.nombre as opcion_desplazado',DB::raw('COUNT(*) as total'))       
        ->groupBy('opcions.nombre')
        ->get();

        $creditos=ComponenteEconomico::join('bancos','componenteeconomicos.banco_id','=','bancos.id')
        ->select( 'bancos.nombre as nombre_banco',DB::raw('COUNT(*) as total'))       
        ->groupBy('bancos.nombre')
        ->get();

        $variedades=AreaCultivo::select(DB::raw( 'SUM(criollo) AS criollo'),DB::raw('SUM(CCN51) AS CCN51'),
        DB::raw('SUM(ICS95) AS ICS95'),DB::raw('SUM(otros) AS otros'))       
        ->get();

        $variedadesinjertado=AreaCultivo::select(DB::raw( 'SUM(variedadcriollo) AS criollo'),DB::raw('SUM(variedadCCN51) AS CCN51'),
        DB::raw('SUM(variedadICS95) AS ICS95'),DB::raw('SUM(variedadotros) AS otros'))       
        ->get();

        $control=LaborCultivo::join('opcions','laborcultivos.control','=','opcions.id')
        ->select( 'opcions.nombre as opcion_control',DB::raw('COUNT(*) as total'))       
        ->groupBy('opcions.nombre')
        ->get();

        $metodo=LaborCultivo::select( 'laborcultivos.metodo',DB::raw('COUNT(*) as total'))       
        ->groupBy('laborcultivos.metodo')
        ->get();

        $drenaje=LaborCultivo::select( 'laborcultivos.drenaje',DB::raw('COUNT(*) as total'))       
        ->groupBy('laborcultivos.drenaje')
        ->get();

        $cosecha=CosechaCultivo::select(DB::raw( 'SUM(frescoTotalMes) AS fresco'),DB::raw('SUM(secoTotalMes) AS seco'))       
        ->get();

        $economico=ComponenteEconomico::select( 'componenteeconomicos.ingresoMensual','componenteeconomicos.gastoMensual',
        'componenteeconomicos.otrosIngresos','componenteeconomicos.ingresoNeto')       
        ->get();

        $finca=FincaComcacaot::join('veredascoms','fincascoms.vereda_id','=','veredascoms.id')
        ->select( 'veredascoms.nombre as nombre_vereda',DB::raw('COUNT(*) as total'))       
        ->groupBy('veredascoms.nombre')
        ->get();

       




        return ['ventas'=>$ventas,'anio'=>$anio,'usuarios'=>$usuarios,
        'estadoCivil'=>$estadoCivil,'etnias'=>$etnias,'sexos'=>$sexos,
        'edades'=>$edades,'escolaridades'=>$escolaridades,'discapacitados'=>$discapacitados,
        'personasacargo'=>$personasacargo,'desplazados'=>$desplazados, 'creditos'=>$creditos,
        'variedades'=> $variedades,'variedadesinjertado'=>$variedadesinjertado,
        'control'=>$control,'metodo'=>$metodo,'drenaje'=>$drenaje,'cosecha'=>$cosecha,
        'economico'=>$economico,'finca'=>$finca];  

    }
}
