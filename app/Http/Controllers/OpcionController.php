<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Opcion;
class OpcionController extends Controller
{
    public function selectOpcion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $opciones = Opcion::select('id','nombre')->orderBy('id','asc')->get();
        return['opciones'=>$opciones];
    }
}
