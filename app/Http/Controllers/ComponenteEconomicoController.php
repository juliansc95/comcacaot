<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\ComponenteEconomico;

class ComponenteEconomicoController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $componentes= ComponenteEconomico::join('componentesocialproductors','componenteeconomicos.productor_id','=','componentesocialproductors.id')
            ->join('personas','componenteeconomicos.productor_id','=','personas.id')
            ->join('fincascoms','componenteeconomicos.finca_id','=','fincascoms.id')
            ->join('opcions  AS op1','componenteeconomicos.credito','=','op1.id')
            ->join('bancos AS b1','componenteeconomicos.banco_id','=','b1.id')
            ->join('opcions AS op2','componenteeconomicos.ahorro','=','op2.id')
            ->join('bancos AS b2','componenteeconomicos.ahorro_id','=','b2.id')
            ->join('opcions AS op3','componenteeconomicos.accionista','=','op3.id')
            ->join('opcions AS op4','componenteeconomicos.interesadoCompra','=','op4.id')
            ->select('componenteeconomicos.id','componenteeconomicos.productor_id','componenteeconomicos.finca_id',
            'componenteeconomicos.ingresoMensual','componenteeconomicos.gastoMensual','componenteeconomicos.otrosIngresos',
            'componenteeconomicos.ingresoNeto','componenteeconomicos.credito','componenteeconomicos.otro_credito','componenteeconomicos.banco_id',
            'componenteeconomicos.ahorro','componenteeconomicos.ahorro_id','componenteeconomicos.otro_ahorro','componenteeconomicos.registro',
            'componenteeconomicos.accionista','componenteeconomicos.numeroAcciones','componenteeconomicos.interesadoCompra',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op1.nombre as nombre_credito','b1.nombre as nombre_banco',
            'op2.nombre as nombre_ahorro','b2.nombre as nombre_banco_ahorro',
            'op3.nombre as opcion_accionista','op4.nombre as opcion_interesados',
           )
            ->orderBy('componenteeconomicos.id','desc')->paginate(3);
        }
        else{
            $componentes= ComponenteEconomico::join('componentesocialproductors','componenteeconomicos.productor_id','=','componentesocialproductors.id')
            ->join('personas','componenteeconomicos.productor_id','=','personas.id')
            ->join('fincascoms','componenteeconomicos.finca_id','=','fincascoms.id')
            ->join('opcions  AS op1','componenteeconomicos.credito','=','op1.id')
            ->join('bancos AS b1','componenteeconomicos.banco_id','=','b1.id')
            ->join('opcions AS op2','componenteeconomicos.ahorro','=','op2.id')
            ->join('bancos AS b2','componenteeconomicos.ahorro_id','=','b2.id')
            ->join('opcions AS op3','componenteeconomicos.accionista','=','op3.id')
            ->join('opcions AS op4','componenteeconomicos.interesadoCompra','=','op4.id')
            ->select('componenteeconomicos.id','componenteeconomicos.productor_id','componenteeconomicos.finca_id',
            'componenteeconomicos.ingresoMensual','componenteeconomicos.gastoMensual','componenteeconomicos.otrosIngresos',
            'componenteeconomicos.ingresoNeto','componenteeconomicos.credito','componenteeconomicos.banco_id','componenteeconomicos.otro_credito',
            'componenteeconomicos.ahorro','componenteeconomicos.ahorro_id','componenteeconomicos.otro_ahorro','componenteeconomicos.registro',
            'componenteeconomicos.accionista','componenteeconomicos.numeroAcciones','componenteeconomicos.interesadoCompra',
            'personas.nombre as nombre_persona','fincascoms.nombre as nombre_finca',
            'op1.nombre as nombre_credito','b1.nombre as nombre_banco',
            'op2.nombre as nombre_ahorro','b2.nombre as nombre_banco_ahorro',
            'op3.nombre as opcion_accionista','op4.nombre as opcion_interesados',
           )
            ->where('componenteeconomicos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('componenteeconomicos.id', 'desc')->paginate(3);          
        }
        return [
            'pagination' => [
                'total'        => $componentes->total(),
                'current_page' => $componentes->currentPage(),
                'per_page'     => $componentes->perPage(),
                'last_page'    => $componentes->lastPage(),
                'from'         => $componentes->firstItem(),
                'to'           => $componentes->lastItem(),
            ],
            'componentes' => $componentes
        ];
    }
    public function store(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();
       
        $componente = new ComponenteEconomico();
        $componente->productor_id = $request->productor_id;
        $componente->finca_id = $request->finca_id;
        $componente->ingresoMensual = $request->ingresoMensual;
        $componente->gastoMensual = $request->gastoMensual;
        $componente->otrosIngresos = $request->otrosIngresos; 
        $componente->ingresoNeto = $request->ingresoNeto;
        $componente->credito = $request->credito;
        $componente->banco_id = $request->banco_id;
        $componente->otro_credito = $request->otro_credito;
        $componente->ahorro = $request->ahorro;
        $componente->ahorro_id = $request->ahorro_id;
        $componente->otro_ahorro = $request->otro_ahorro;
        $componente->registro = $request->registro;
        $componente->accionista = $request->accionista;
        $componente->numeroAcciones = $request->numeroAcciones;
        $componente->interesadoCompra = $request->interesadoCompra;
        $componente->save();
            DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        $componente =ComponenteEconomico::findOrFail($request->id);
        $componente->productor_id = $request->productor_id;
        $componente->finca_id = $request->finca_id;
        $componente->ingresoMensual = $request->ingresoMensual;
        $componente->gastoMensual = $request->gastoMensual;
        $componente->otrosIngresos = $request->otrosIngresos; 
        $componente->ingresoNeto = $request->ingresoNeto;
        $componente->credito = $request->credito;
        $componente->otro_credito = $request->otro_credito;
        $componente->banco_id = $request->banco_id;
        $componente->ahorro = $request->ahorro;
        $componente->ahorro_id = $request->ahorro_id;
        $componente->otro_ahorro = $request->otro_ahorro;
        $componente->registro = $request->registro;
        $componente->accionista = $request->accionista;
        $componente->numeroAcciones = $request->numeroAcciones;
        $componente->interesadoCompra = $request->interesadoCompra;
        $componente->save();
    }
}
