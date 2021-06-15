<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProgramaEstado;
class ProgramaEstadoController extends Controller
{
    public function selectProgramaEstado(Request $request){
        if(!$request->ajax()) return redirect('/');
        $programasEstado = ProgramaEstado::select('id','nombre')->orderBy('id','asc')->get();
        return['programasEstado'=>$programasEstado];
    }
}
