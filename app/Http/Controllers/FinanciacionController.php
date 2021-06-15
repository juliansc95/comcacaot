<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Financiacion;

class FinanciacionController extends Controller
{
    public function selectFinanciacion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $financiacion = Financiacion::select('id','nombre')->orderBy('id','asc')->get();
        return['financiacion'=>$financiacion];
    }
}
