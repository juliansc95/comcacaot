<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ResiduosSolido;

class ResiduosSolidoController extends Controller
{
    public function selectResiduoSolido(Request $request){
        if(!$request->ajax()) return redirect('/');
        $residuo = ResiduosSolido::select('id','nombre')->orderBy('id','asc')->get();
        return['residuo'=>$residuo];
    }
}
