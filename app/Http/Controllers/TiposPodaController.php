<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TiposPoda;
class TiposPodaController extends Controller
{
    public function selectTiposPoda(Request $request){
        if(!$request->ajax()) return redirect('/');
        $tiposPoda = TiposPoda::select('id','nombre')->orderBy('id','asc')->get();
        return['tiposPoda'=>$tiposPoda];
    }
}
