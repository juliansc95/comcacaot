<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Asociacion;
class AsociacionController extends Controller
{
    public function selectAsociacion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $asociaciones = Asociacion::select('id','nombre')->orderBy('id','asc')->get();
        return['asociaciones'=>$asociaciones];
    }
}
