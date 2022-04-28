<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\VentaCom;
use App\VentaCategoriaCom;

class VentaComController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $id = $request->id;
            $ventas = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
            ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
            ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
            ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
            ->join('zonas','ventacoms.zona_id','=','zonas.id')
            ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
            ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
            'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
            'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
            'ventacoms.observaciones','personas.nombre as nombre_persona','estadoventas.nombre as nombre_estadoVenta',
            'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
            )
             ->orderBy('ventacoms.id', 'desc')->paginate(10);
        }
        if($criterio == 'personas'){
            $ventas = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
            ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
            ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
            ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
            ->join('zonas','ventacoms.zona_id','=','zonas.id')
            ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
            ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
            'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
            'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
            'ventacoms.observaciones','personas.nombre as nombre_persona','estadoventas.nombre as nombre_estadoVenta',
            'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
            )
        ->where($criterio.'.nombre', 'like', '%'. $buscar . '%')
        ->orderBy('ventacoms.id', 'desc')->paginate(10);
        }
        else{
            $ventas = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
            ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
            ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
            ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
            ->join('zonas','ventacoms.zona_id','=','zonas.id')
            ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
            ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
            'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
            'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
            'ventacoms.observaciones','personas.nombre as nombre_persona','estadoventas.nombre as nombre_estadoVenta',
            'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
            )
            ->where('ventacoms.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('ventacoms.id', 'desc')->paginate(10);
        }
        
        return [
            'pagination' => [
                'total'        => $ventas->total(),
                'current_page' => $ventas->currentPage(),
                'per_page'     => $ventas->perPage(),
                'last_page'    => $ventas->lastPage(),
                'from'         => $ventas->firstItem(),
                'to'           => $ventas->lastItem(),
            ],
            'ventas' => $ventas
        ];
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        try{
            DB::beginTransaction();

            $mytime= Carbon::now('America/Lima');

            $venta = new VentaCom();
            $venta->productor_id = $request->productor_id;
            $venta->lugarVenta_id = $request->lugarVenta_id;
            $venta->vereda_id = $request->vereda_id;
            $venta->zona_id = $request->zona_id;
            $venta->fechaVenta = $mytime->toDateTimeString();
            $venta->totalKilos = $request->totalKilos;
            $venta->totalKilosNetos = $request->totalKilosNetos;
            $venta->totalIncentivoXkg = $request->totalIncentivoXkg;
            $venta->totalIncentivo = $request->totalIncentivo;
            $venta->totalNeto = $request->totalNeto; 
            $venta->estado_id = '1';
            $venta->observaciones = $request->observaciones; ;
            $venta->save();

            $ventaCategorias = $request->data;//Array de detalles
            //Recorro todos los elementos

            foreach($ventaCategorias as $ep=>$ventaCat)
            {
                $ventaCategoria = new VentaCategoriaCom();
                $ventaCategoria->ventas_id = $venta->id;
                $ventaCategoria->categoria_id = $ventaCat['categoria_id'];
                $ventaCategoria->peso = $ventaCat['peso'];
                $ventaCategoria->humedad = $ventaCat['humedad'];
                $ventaCategoria->fermentacion = $ventaCat['fermentacion'];
                $ventaCategoria->descuentoHumedadKg = $ventaCat['descuentoHumedadKg'];
                $ventaCategoria->valorUnitario = $ventaCat['valorUnitario'];
                $ventaCategoria->subtotal = $ventaCat['subtotal'];    
                $ventaCategoria->save();
            }          

            DB::commit();
            return[
                'id'=>$venta->id
            ];
        } catch (Exception $e){
            DB::rollBack();
        }
    }

    public function obtenerCabecera(Request $request){
        if (!$request->ajax()) return redirect('/');

        $id = $request->id;
        $venta = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
            ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
            ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
            ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
            ->join('zonas','ventacoms.zona_id','=','zonas.id')
            ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
            ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
            'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
            'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
            'ventacoms.observaciones','personas.nombre as nombre_persona','estadoventas.nombre as nombre_estadoVenta',
            'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
            )
            ->where('ventacoms.id','=',$id)    
            ->orderBy('ventacoms.id', 'desc')->take(1)->get();
        
        return ['venta' => $venta];
    }
    public function obtenerVentaCategoria(Request $request){
        if (!$request->ajax()) return redirect('/');

        $id = $request->id;
        $ventaCategoria = VentaCategoriaCom::join('categoriamoras','ventas_categoriacoms.categoria_id','=','categoriamoras.id')
        ->select('ventas_categoriacoms.peso','ventas_categoriacoms.humedad','ventas_categoriacoms.fermentacion',
        'ventas_categoriacoms.descuentoHumedadKg','ventas_categoriacoms.valorUnitario','ventas_categoriacoms.subtotal',
        'categoriamoras.nombre as nombre_categoria')
        ->where('ventas_categoriacoms.ventas_id','=',$id)
        ->orderBy('ventas_categoriacoms.id', 'desc')->get();
        
        return ['ventaCategoria' => $ventaCategoria];
    }
    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $venta = VentaCom::findOrFail($request->id);
        $venta->estado_id = '5';
        $venta->save();
    }

    public function pdf(Request $request,$id){
        $venta = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
        ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
        ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
        ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
        ->join('zonas','ventacoms.zona_id','=','zonas.id')
        ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
        ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
        'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
        'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
        'ventacoms.observaciones','personas.nombre as nombre_persona','personas.num_documento as num_documento',
        'estadoventas.nombre as nombre_estadoVenta','personas.direccion as direccion',
        'personas.telefono as telefono','personas.email as email',
        'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
        )
        ->where('ventacoms.id','=',$id)    
        ->orderBy('ventacoms.id', 'desc')->take(1)->get();

        $ventaCategoria = VentaCategoriaCom::join('categoriamoras','ventas_categoriacoms.categoria_id','=','categoriamoras.id')
        ->select('ventas_categoriacoms.peso','ventas_categoriacoms.humedad','ventas_categoriacoms.fermentacion',
        'ventas_categoriacoms.descuentoHumedadKg','ventas_categoriacoms.valorUnitario','ventas_categoriacoms.subtotal',
        'categoriamoras.nombre as nombre_categoria')
        ->where('ventas_categoriacoms.ventas_id','=',$id)
        ->orderBy('ventas_categoriacoms.id', 'desc')->get();

        $nombrePdf=VentaCom::select('ventacoms.fechaVenta')
        ->where('id',$id)->get();

        
        $pdf = \PDF::loadView('pdf.venta',['venta'=>$venta,'ventaCategoria' => $ventaCategoria]);
        return $pdf->download('venta-'.$nombrePdf[0]->fechaVenta.'.pdf');
    }

    public function pdfTicket(Request $request,$id){
        $venta = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
        ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
        ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
        ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
        ->join('zonas','ventacoms.zona_id','=','zonas.id')
        ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
        ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
        'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
        'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
        'ventacoms.observaciones','personas.nombre as nombre_persona','personas.num_documento as num_documento',
        'estadoventas.nombre as nombre_estadoVenta','personas.direccion as direccion',
        'personas.telefono as telefono','personas.email as email',
        'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
        )
        ->where('ventacoms.id','=',$id)    
        ->orderBy('ventacoms.id', 'desc')->take(1)->get();

        $ventaCategoria = VentaCategoriaCom::join('categoriamoras','ventas_categoriacoms.categoria_id','=','categoriamoras.id')
        ->select('ventas_categoriacoms.peso','ventas_categoriacoms.humedad','ventas_categoriacoms.fermentacion',
        'ventas_categoriacoms.descuentoHumedadKg','ventas_categoriacoms.valorUnitario','ventas_categoriacoms.subtotal',
        'categoriamoras.nombre as nombre_categoria')
        ->where('ventas_categoriacoms.ventas_id','=',$id)
        ->orderBy('ventas_categoriacoms.id', 'desc')->get();

        $nombrePdf=VentaCom::select('ventacoms.fechaVenta')
        ->where('id',$id)->get();

        $customPaper = array(0,0,140,1024);
        $pdf = \PDF::loadView('pdf.ventaTicket',['venta'=>$venta,'ventaCategoria' => $ventaCategoria])->setPaper($customPaper);
        return $pdf->download('venta-'.$nombrePdf[0]->fechaVenta.'.pdf');
    }

    public function excel(Request $request)
    {       
        $ventas = VentaCom::join('personas','ventacoms.productor_id','=','personas.id')
        ->join('componentesocialproductors','ventacoms.productor_id','=','componentesocialproductors.id')
        ->join('lugarventas','ventacoms.lugarVenta_id','=','lugarventas.id')
        ->join('veredascoms','ventacoms.vereda_id','=','veredascoms.id')
        ->join('zonas','ventacoms.zona_id','=','zonas.id')
        ->join('estadoventas','ventacoms.estado_id','=','estadoventas.id')
        ->select('ventacoms.id','ventacoms.productor_id','ventacoms.lugarVenta_id','ventacoms.vereda_id',
        'ventacoms.zona_id','ventacoms.fechaVenta','ventacoms.totalKilos','ventacoms.totalKilosNetos',
        'ventacoms.totalIncentivoXkg','ventacoms.totalIncentivo','ventacoms.totalNeto','ventacoms.estado_id',
        'ventacoms.observaciones','personas.nombre as nombre_persona','estadoventas.nombre as nombre_estadoVenta',
        'lugarventas.nombre as nombre_lugarVenta','veredascoms.nombre as nombre_vereda','zonas.nombre as nombre_zona'
        )
        ->orderBy('ventacoms.id','desc')->get();
            
            return [
                'ventas' => $ventas
            ];
       
    }


}
