<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banco;
class BancoController extends Controller
{
    public function selectBanco(Request $request){
        if(!$request->ajax()) return redirect('/');
        $bancos = Banco::select('id','nombre')->orderBy('id','asc')->get();
        return['bancos'=>$bancos];
    }
}
