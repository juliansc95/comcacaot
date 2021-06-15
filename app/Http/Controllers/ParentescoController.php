<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Parentesco;
class ParentescoController extends Controller
{
    public function selectParentesco(Request $request){
        if(!$request->ajax()) return redirect('/');
        $parentescos = Parentesco::select('id','nombre')->orderBy('id','asc')->get();
        return['parentescos'=>$parentescos];
    }
}
