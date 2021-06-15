<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\EstadoCultivo;

class EstadoCultivoController extends Controller
{
    public function selectEstadoCultivo(Request $request){
        if(!$request->ajax()) return redirect('/');
        $estadoCultivo = EstadoCultivo::select('id','nombre')->orderBy('id','asc')->get();
        return['estadoCultivo'=>$estadoCultivo];
    }
}
