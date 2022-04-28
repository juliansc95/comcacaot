<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ViaAcceso;

class ViaAccesoController extends Controller
{
    public function selectVia(Request $request){
        //if(!$request->ajax()) return redirect('/');
        $viaAcceso = ViaAcceso::select('id','nombre')->orderBy('id','asc')->get();
        return['viaAcceso'=>$viaAcceso];
    }  
}
