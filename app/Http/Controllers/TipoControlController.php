<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TipoControl;

class TipoControlController extends Controller
{
    public function selectTipoControl(Request $request){
        if(!$request->ajax()) return redirect('/');
        $tipocontrol = TipoControl::select('id','nombre')->orderBy('id','asc')->get();
        return['tipocontrol'=>$tipocontrol];
    }
}
