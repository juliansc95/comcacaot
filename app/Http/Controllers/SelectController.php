<?php

namespace App\Http\Controllers;

use App\Asociacion;
use App\Banco;
use App\ComponenteSocialProductor;
use App\Departamento;
use App\EstadoCivil;
use App\EstadoCultivo;
use App\Etnia;
use App\Fermentacion;
use App\Financiacion;
use App\GradoEscolaridad;
use App\Linea;
use App\LugarVenta;
use App\MantenimientoPlantacion;
use App\Municipio;
use App\Opcion;
use App\Parentesco;
use App\Posesion;
use App\ProgramaEstado;
use App\ResiduosSolido;
use App\Sexo;
use App\TipoControl;
use App\TipoId;
use App\TiposPoda;
use App\TipoVivienda;
use App\Vereda;
use App\VeredaCom;
use App\Vivienda;
use App\Zona;
use Illuminate\Http\Request;

class SelectController extends Controller
{
    public  function  appSelects(){

        $personas= ComponenteSocialProductor::join('personas','componentesocialproductors.id','=','personas.id')
            ->select('componentesocialproductors.id','personas.nombre')->orderBy('componentesocialproductors.id','asc')->get();
        $tipoIds = TipoId::select('id','nombre')->orderBy('id','asc')->get();
        $sexos = Sexo::select('id','nombre')->orderBy('id','asc')->get();
        $grados = GradoEscolaridad::select('id','nombre')->orderBy('id','asc')->get();
        $etnias = Etnia::select('id','nombre')->orderBy('id','asc')->get();
        $departamentos = Departamento::select('id','nombre')->where('id', '=','22')->orderBy('id','asc')->get();
        $municipios = Municipio::select('id','nombre')->orderBy('id','asc')->get();
        $veredas = Vereda::select('id','nombre')->orderBy('id','asc')->get();
        $veredascom = VeredaCom::select('id','nombre','zona_id')->orderBy('id','asc')->get();
        $viviendas = Vivienda::select('id','nombre')->orderBy('id','asc')->get();
        $tipoViviendas = TipoVivienda::select('id','nombre')->orderBy('id','asc')->get();
        $opciones = Opcion::select('id','nombre')->orderBy('id','asc')->get();
        $programasEstado = ProgramaEstado::select('id','nombre')->orderBy('id','asc')->get();
        $parentescos = Parentesco::select('id','nombre')->orderBy('id','asc')->get();
        $estadoCivil = EstadoCivil::select('id','nombre')->orderBy('id','asc')->get();
        $estadoCultivo = EstadoCultivo::select('id','nombre')->orderBy('id','asc')->get();
        $mantenimiento = MantenimientoPlantacion::select('id','nombre')->orderBy('id','asc')->get();
        $tiposPoda = TiposPoda::select('id','nombre')->orderBy('id','asc')->get();
        $financiacion = Financiacion::select('id','nombre')->orderBy('id','asc')->get();
        $tipocontrol = TipoControl::select('id','nombre')->orderBy('id','asc')->get();
        $fermentacion = Fermentacion::select('id','nombre')->orderBy('id','asc')->get();
        $residuo = ResiduosSolido::select('id','nombre')->orderBy('id','asc')->get();
        $zonas = Zona::select('id','nombre')->orderBy('id','asc')->get();
        $asociaciones = Asociacion::select('id','nombre')->orderBy('id','asc')->get();
        $lineas = Linea::select('id','nombre')->orderBy('id','asc')->get();
        $bancos = Banco::select('id','nombre')->orderBy('id','asc')->get();
        $registros = [
            ["id" => "Ingresos", "nombre" => "Ingresos"],
            ["id" => "Gastos", "nombre" => "Gastos"],
            ["id" => "Ingresos y gastos", "nombre" => "Ingresos y gastos"],
            ["id" => "No maneja", "nombre" => "No maneja"],
        ];
        $posesions = Posesion::select('id','nombre')->orderBy('id','asc')->get();
        $viasAcceso = [
            ["id" => "Rio", "nombre" => "Rio"],
            ["id" => "Mar", "nombre" => "Mar"],
            ["id" => "Carretera", "nombre" => "Carretera"],

        ];
        $metodo = [
            ["id" => "Manual", "nombre" => "Manual"],
            ["id" => "Quimico", "nombre" => "Quimico"],
            ["id" => "Ambos", "nombre" => "Ambos"],

        ];

        $drenajes = [
            ["id" => "Primario", "nombre" => "Primario"],
            ["id" => "Secundario", "nombre" => "Secundario"],
            ["id" => "Ambos", "nombre" => "Ambos"],

        ];

        $fertilizacion = [
            ["id" => "Organica", "nombre" => "Organica"],
            ["id" => "Quimica", "nombre" => "Quimica"],
            ["id" => "No", "nombre" => "No"],

        ];
        $cosecha = [
            ["id" => "Semanal", "nombre" => "Semanal"],
            ["id" => "Quincenal", "nombre" => "Quincenal"],
            ["id" => "Mensual", "nombre" => "Mensual"],

        ];
        $lugarVentas = LugarVenta::select('id','nombre')->orderBy('id','asc')->get();

        $respuesta  = [
            $personas, //0
            $tipoIds, //1
            $sexos,//2
            $grados,//3
            $etnias,//4
            $departamentos,//5
            $municipios,//6
            $veredas,//7
            $veredascom,//8
            $viviendas,//9
            $tipoViviendas,//10
            $opciones,//11
            $programasEstado,//12
            $parentescos,//13
            $estadoCivil,//14
            $estadoCultivo,//15
            $mantenimiento,//16
            $tiposPoda,//17
            $financiacion,//18
            $tipocontrol,//19
            $fermentacion,//20
            $residuo,//21
            $zonas,//22
            $asociaciones,//23
            $lineas,//24,
            $bancos,//25
            $registros,//26
            $posesions,//27
            $viasAcceso,//28
            $metodo,//29
            $drenajes,//30
            $fertilizacion,//31
            $cosecha,//32
            $lugarVentas//33

        ];
        return $respuesta ;

    }
}
