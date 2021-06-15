<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Fermentacion;

class FermentacionController extends Controller
{
    public function selectFermentacion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $fermentacion = Fermentacion::select('id','nombre')->orderBy('id','asc')->get();
        return['fermentacion'=>$fermentacion];
    }
}
