<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TipoVivienda;

class TipoViviendaController extends Controller
{
    public function selectTipoVivienda(Request $request){
        if(!$request->ajax()) return redirect('/');
        $tipoViviendas = TipoVivienda::select('id','nombre')->orderBy('id','asc')->get();
        return['tipoViviendas'=>$tipoViviendas];
    }
}
