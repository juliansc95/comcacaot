<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\FincaComcacaot;
use App\ViaAccesoFinca;

class FincaComcacaotController extends Controller
{
    public function index(Request $request)
    {
        //if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $fincas= FincaComcacaot::join('componentesocialproductors','fincascoms.productor_id','=','componentesocialproductors.id')
            ->join('personas','fincascoms.productor_id','=','personas.id')
            ->join('departamentos','fincascoms.departamento_id','=','departamentos.id')
            ->join('municipios','fincascoms.municipio_id','=','municipios.id')
            ->join('veredascoms','fincascoms.vereda_id','=','veredascoms.id')
            ->join('zonas','fincascoms.zona_id','=','zonas.id')
            ->join('posesions','fincascoms.posesion_id','=','posesions.id')
            ->select('fincascoms.id','fincascoms.nombre','fincascoms.productor_id','fincascoms.fechaRegistro','fincascoms.telefono',
            'fincascoms.departamento_id','fincascoms.municipio_id','fincascoms.vereda_id','fincascoms.zona_id',
            'fincascoms.areaTotal','fincascoms.viasAcceso',
            'fincascoms.latitud','fincascoms.longitud','fincascoms.altitud','fincascoms.posesion_id',
            'personas.nombre as nombre_persona','departamentos.nombre as nombre_departamento',
            'municipios.nombre as nombre_municipio','veredascoms.nombre as nombre_vereda',
            'zonas.nombre as nombre_zona',
            'posesions.nombre as nombre_posesion')
            ->orderBy('fincascoms.id','desc')->paginate(10);
        }
        else{
            $fincas= FincaComcacaot::join('componentesocialproductors','fincascoms.productor_id','=','componentesocialproductors.id')
            ->join('personas','fincascoms.productor_id','=','personas.id')
            ->join('departamentos','fincascoms.departamento_id','=','departamentos.id')
            ->join('municipios','fincascoms.municipio_id','=','municipios.id')
            ->join('veredascoms','fincascoms.vereda_id','=','veredascoms.id')
            ->join('zonas','fincascoms.zona_id','=','zonas.id')
            ->join('posesions','fincascoms.posesion_id','=','posesions.id')
            ->select('fincascoms.id','fincascoms.nombre','fincascoms.productor_id','fincascoms.fechaRegistro','fincascoms.telefono',
            'fincascoms.departamento_id','fincascoms.municipio_id','fincascoms.vereda_id','fincascoms.zona_id','fincascoms.areaTotal','fincascoms.viasAcceso',
            'fincascoms.latitud','fincascoms.longitud','fincascoms.altitud','fincascoms.posesion_id',
            'personas.nombre as nombre_persona','departamentos.nombre as nombre_departamento',
            'municipios.nombre as nombre_municipio','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona',
            'posesions.nombre as nombre_posesion')
            ->where('fincascoms.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('fincascoms.id', 'desc')->paginate(10);
        }
        return [
            'pagination' => [
                'total'        => $fincas->total(),
                'current_page' => $fincas->currentPage(),
                'per_page'     => $fincas->perPage(),
                'last_page'    => $fincas->lastPage(),
                'from'         => $fincas->firstItem(),
                'to'           => $fincas->lastItem(),
            ],
            'fincas' => $fincas
        ];
    }
    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
        $registro= Carbon::parse($request->fechaRegistro)->toDateString();
        $finca = new FincaComcacaot();
        $finca->nombre = $request->nombre;
        $finca->productor_id = $request->productor_id;
        $finca->fechaRegistro = $registro;
        $finca->telefono = $request->telefono;
        $finca->departamento_id = $request->departamento_id;
        $finca->municipio_id = $request->municipio_id;
        $finca->vereda_id = $request->vereda_id;
        $finca->zona_id = $request->zona_id;
        $finca->areaTotal = $request->areaTotal;
        $viasAccesos = json_decode($request->viasAcceso_id, true);//Array de detalles
        //Recorro todos los elementos
        foreach($viasAccesos as $viasAcceso)
        {
            $newvias = new ViaAccesoFinca();
            $newvias -> via_id = $viasAcceso['via_id'];
            $newvias -> finca_id = $viasAcceso['finca_id'];
            $newvias->save();
        }    
        $finca->latitud = $request->latitud;
        $finca->longitud = $request->longitud;
        $finca->altitud = $request->altitud;
        $finca->posesion_id = $request->posesion_id;
        $finca->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        $registro= Carbon::parse($request->fechaRegistro)->toDateString();
        $finca =FincaComcacaot::findOrFail($request->id);
        $finca->nombre = $request->nombre;
        $finca->productor_id = $request->productor_id;
        $finca->fechaRegistro = $registro;
        $finca->telefono = $request->telefono;
        $finca->departamento_id = $request->departamento_id;
        $finca->municipio_id = $request->municipio_id;
        $finca->vereda_id = $request->vereda_id;
        $finca->zona_id = $request->zona_id;
        $finca->areaTotal = $request->areaTotal;
        $finca->viasAcceso = $request->viasAcceso;
        $finca->latitud = $request->latitud;
        $finca->longitud = $request->longitud;
        $finca->altitud = $request->altitud;
        $finca->posesion_id = $request->posesion_id;
        $finca->save();
    }
    public function selectFinca(Request $request){
        if(!$request->ajax()) return redirect('/');
        $id=$request->id;
        $fincas= FincaComcacaot::select('id','nombre')
        ->where('productor_id','=',$id)
        ->orderBy('id','asc')->get();
        return['fincas'=>$fincas];
    }
    public function selectFincaApi(Request $request){
        //if(!$request->ajax()) return redirect('/');
        $id=$request->id;
        $fincas= FincaComcacaot::select('id','nombre','productor_id')
            ->orderBy('id','asc')->get();
        return $fincas;
    }

}
