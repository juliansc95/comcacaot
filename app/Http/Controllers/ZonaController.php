<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Zona;

class ZonaController extends Controller
{
    public function selectZona(Request $request){
        if(!$request->ajax()) return redirect('/');
        $zonas = Zona::select('id','nombre')->orderBy('id','asc')->get();
        return['zonas'=>$zonas];
    }
}
