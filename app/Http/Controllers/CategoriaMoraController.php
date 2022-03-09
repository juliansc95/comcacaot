<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CategoriaMora;
use Illuminate\Support\Facades\DB;

class CategoriaMoraController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if($buscar == ''){
            $categoriaMoras= CategoriaMora::select('id','nombre','valorUnitario','ValorDonacion','valorTransporte',
            'valorAsohof','valorCuatroPorMil')
            ->orderBy('id','desc')->paginate(19);
        }
        else{
            $categoriaMoras= CategoriaMora::select('id','nombre','valorUnitario','ValorDonacion','valorTransporte',
            'valorAsohof','valorCuatroPorMil')
            ->where('categoriamoras.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('categoriamoras.id', 'desc')->paginate(10);
        }
        return [
            'pagination' => [
                'total'        => $categoriaMoras->total(),
                'current_page' => $categoriaMoras->currentPage(),
                'per_page'     => $categoriaMoras->perPage(),
                'last_page'    => $categoriaMoras->lastPage(),
                'from'         => $categoriaMoras->firstItem(),
                'to'           => $categoriaMoras->lastItem(),
            ],
            'categoriaMoras' => $categoriaMoras
        ];
    }

    public function buscarCategoria(Request $request){
        if(!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $categoriaMoras= CategoriaMora::where('id','=',$filtro)
        ->select('id','nombre','valorUnitario','ValorDonacion','valorTransporte',
        'valorAsohof','valorCuatroPorMil')
        ->orderBy('nombre','asc')
        ->take(1)->get();


        return[ 'categoriaMoras' => $categoriaMoras];
    }


    public function listarCategoria(Request $request){
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;

        if ($buscar==''){
            $categoriaMoras= CategoriaMora::select('id','nombre','valorUnitario','ValorDonacion','valorTransporte',
            'valorAsohof','valorCuatroPorMil')
            ->orderBy('id', 'desc')->paginate(10);
        }
        else{
            $categoriaMoras= CategoriaMora::select('id','nombre','valorUnitario','ValorDonacion','valorTransporte',
            'valorAsohof','valorCuatroPorMil')
            ->where('categoriamoras.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('categoriamoras.id', 'desc')->paginate(10);
        }


        return ['categoriaMoras' => $categoriaMoras];
    }

    public function store(Request $request)
    {
        //if(!$request->ajax()) return redirect('/');

        try{
        DB::beginTransaction();
        $categoriaMora = new CategoriaMora();
        $categoriaMora->nombre = $request->nombre;
        $categoriaMora->valorUnitario = $request->valorUnitario;
        $categoriaMora->valorDonacion = $request->valorDonacion;
        $categoriaMora->valorTransporte = $request->valorTransporte;
        $categoriaMora->valorAsohof = $request->valorAsohof;
        $categoriaMora->valorCuatroPorMil = $request->valorCuatroPorMil;
        $categoriaMora->save();

        DB::commit();
        } catch(Exception $e){
            DB::rollBack();
        }
    }

    public function update(Request $request)
    {
        if(!$request->ajax()) return redirect('/');
        try{
        DB::beginTransaction();

        $categoriaMora= CategoriaMora::findOrFail($request->id);
        $categoriaMora->nombre = $request->nombre;
        $categoriaMora->valorUnitario = $request->valorUnitario;
        $categoriaMora->valorDonacion = $request->valorDonacion;
        $categoriaMora->valorTransporte = $request->valorTransporte;
        $categoriaMora->valorAsohof = $request->valorAsohof;
        $categoriaMora->valorCuatroPorMil = $request->valorCuatroPorMil;
        $categoriaMora->save();
        DB::commit();
        }catch(Exception $e){
            DB::rollback();
        }
    }
}
