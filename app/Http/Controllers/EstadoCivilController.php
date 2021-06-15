<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\EstadoCivil;

class EstadoCivilController extends Controller
{
    public function selectEstadoCivil(Request $request){
        if(!$request->ajax()) return redirect('/');
        $estadoCivil = EstadoCivil::select('id','nombre')->orderBy('id','asc')->get();
        return['estadoCivil'=>$estadoCivil];
    }
}
