<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Departamento;

class DepartamentoController extends Controller
{
    public function selectDepartamento(Request $request){
        if(!$request->ajax()) return redirect('/');
        $departamentos = Departamento::select('id','nombre')
        ->where('id', '=','22')
        ->orderBy('id','asc')->get();
        return['departamentos'=>$departamentos];
    }  
}
