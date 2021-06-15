<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Vivienda;
class ViviendaController extends Controller
{
    public function selectVivienda(Request $request){
        if(!$request->ajax()) return redirect('/');
        $viviendas = Vivienda::select('id','nombre')->orderBy('id','asc')->get();
        return['viviendas'=>$viviendas];
    }
}
