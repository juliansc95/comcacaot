<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\MantenimientoPlantacion;

class MantenimientoPlantacionController extends Controller
{
    public function selectMantenimientoPlantacion(Request $request){
        if(!$request->ajax()) return redirect('/');
        $mantenimiento = MantenimientoPlantacion::select('id','nombre')->orderBy('id','asc')->get();
        return['mantenimiento'=>$mantenimiento];
    }
}
