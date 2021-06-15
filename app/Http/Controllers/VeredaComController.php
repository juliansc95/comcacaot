<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\VeredaCom;

class VeredaComController extends Controller
{
    public function selectVereda(Request $request){
        if(!$request->ajax()) return redirect('/');
        $veredas = VeredaCom::select('id','nombre','zona_id')->orderBy('id','asc')->get();
        return['veredas'=>$veredas];
    }

    public function selectVeredaZona(Request $request){
        if(!$request->ajax()) return redirect('/');
        $id=$request->id;
        $veredas= VeredaCom::select('id','nombre')
        ->where('zona_id','=',$id)
        ->orderBy('id','asc')->get();
        return['veredas'=>$veredas];
    }  

    public function selectVereda2(Request $request){
        if(!$request->ajax()) return redirect('/');
        $filtro = $request->filtro;
        $veredas = VeredaCom::select('id','nombre')
        ->where('nombre', 'like', '%'. $filtro . '%')
        ->orderBy('nombre', 'asc')->get();
        return['veredas'=>$veredas];
    }
    
    
}
