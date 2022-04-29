<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', ['as' => 'login', 'uses' => 'Auth\LoginController@loginApi']);
    Route::post('register', 'Auth\LoginController@register');
    Route::post('logout', 'Auth\LoginController@logout');
    Route::post('home', 'Auth\LoginController@me');

    //Route::post('refresh', 'Auth2\AuthController@refresh');
});

Route::get('/app/version', function () {
    return [
        "version" => '1.8',
        "url" =>  "https://comcacaot.com/src/comcacaot.apk"
    ];
});

Route::get('/tipoId/selectTipoId','TipoIdController@selectTipoId');
Route::get('/sexo/selectSexo','SexoController@selectSexo');
Route::get('/escolaridad/selectEscolaridad','GradoEscolaridadController@selectGradoEscolaridad');
Route::get('/etnia/selectEtnia','EtniaController@selectEtnia');
Route::get('/departamento/selectDepartamento','DepartamentoController@selectDepartamento');
Route::get('/municipio/selectMunicipio','MunicipioController@selectMunicipio');
Route::get('/vereda/selectVereda','VeredaController@selectVereda');
Route::get('/vereda/selectVereda2','VeredaComController@selectVereda2');
Route::get('/vivienda/selectVivienda','ViviendaController@selectVivienda');
Route::get('/tipoVivienda/selectTipoVivienda','TipoViviendaController@selectTipoVivienda');
Route::get('/opcion/selectOpcion','OpcionController@selectOpcion');
Route::get('/estado/selectProgramaEstado','ProgramaEstadoController@selectProgramaEstado');
Route::get('/parentesco/selectParentesco','ParentescoController@selectParentesco');
Route::get('/estadoCivil/selectEstadoCivil','EstadoCivilController@selectEstadoCivil');
Route::get('/estadoCultivo/selectEstadoCultivo','EstadoCultivoController@selectEstadoCultivo');
Route::get('/mantenimiento/selectMantenimiento','MantenimientoPlantacionController@selectMantenimientoPlantacion');
Route::get('/tiposPoda/selecttiposPoda','TiposPodaController@selectTiposPoda');
Route::get('/financiacion/selectFinanciacion','FinanciacionController@selectFinanciacion');
Route::get('/tipocontrol/selectTipoControl','TipoControlController@selectTipoControl');
Route::get('/fermentacion/selectFermentacion','FermentacionController@selectFermentacion');
Route::get('/residuo/selectResiduo','ResiduosSolidoController@selectResiduoSolido');
Route::get('/zona/selectZona','ZonaController@selectZona');
Route::get('/asociacion/selectAsociacion','AsociacionController@selectAsociacion');
Route::get('/vereda/selectVeredaZona/{id}','VeredaComController@selectVeredaZona');

Route::get('/productor/selectProductor','ComponenteSocialProductorController@selectProductor');
Route::get('/productor/selectProductor2','ComponenteSocialProductorController@selectProductor2');

Route::get('/linea/selectLinea','LineaController@selectLinea');
Route::get('/finca/selectFinca/{id}','FincaComcacaotController@selectFinca');
Route::get('/lugarVenta/selectLugarVenta','LugarVentaController@selectLugarVenta');
Route::get('/banco/selectBanco','BancoController@selectBanco');
Route::get('/lugarVenta/selectLugarVenta2','LugarVentaController@selectLugarVenta2');

//Rutas Ventas
Route::get('/venta', 'VentaComController@index');
Route::post('/venta/registrar', 'VentaComController@store');
Route::put('/venta/desactivar', 'VentaComController@desactivar');
Route::get('/venta/obtenerCabecera', 'VentaComController@obtenerCabecera');
Route::get('/venta/obtenerDetalles', 'VentaComController@obtenerVentaCategoria');

 //Rutas Lugares de Venta
 Route::get('/lugarVenta','LugarVentaController@index');
 Route::post('/lugarVenta/registrar','LugarVentaController@store');
 Route::put('/lugarVenta/actualizar','LugarVentaController@update');

//Rutas Categorias
Route::get('/categoriaMora','CategoriaMoraController@index');
Route::post('/categoriaMora/registrar','CategoriaMoraController@store');
Route::put('/categoriaMora/actualizar','CategoriaMoraController@update');
Route::get('/categoriaMora/buscarCategoria','CategoriaMoraController@buscarCategoria');
Route::get('/categoriaMora/listarCategoria','CategoriaMoraController@listarCategoria');

//Rutas Fincas
Route::get('/finca','FincaComcacaotController@selectFincaApi');
Route::post('/finca/registrar','FincaComcacaotController@store');
Route::put('/finca/actualizar','FincaComcacaotController@update');

 //Rutas Area cultivo
 Route::get('/areacultivo','AreaCultivoController@index');
 Route::post('/areacultivo/registrar','AreaCultivoController@store');
 Route::put('/areacultivo/actualizar','AreaCultivoController@update');

//Rutas Labor cultivo
Route::get('/laborcultivo','LaborCultivoController@index');
Route::post('/laborcultivo/registrar','LaborCultivoController@store');
Route::put('/laborcultivo/actualizar','LaborCultivoController@update');

//Rutas Cosecha cultivo
Route::get('/cosechacultivo','CosechaCultivoController@index');
Route::post('/cosechacultivo/registrar','CosechaCultivoController@store');
Route::put('/cosechacultivo/actualizar','CosechaCultivoController@update');

 //Rutas Manejo Ambiental
 Route::get('/manejoambiental','ManejoAmbientalController@index');
 Route::post('/manejoambiental/registrar','ManejoAmbientalController@store');
 Route::put('/manejoambiental/actualizar','ManejoAmbientalController@update');

 //Rutas productores
 Route::get('/productor','ComponenteSocialProductorController@index');
 Route::post('/productor/registrar','ComponenteSocialProductorController@store');
 Route::put('/productor/actualizar','ComponenteSocialProductorController@update');

 Route::get('/economico','ComponenteEconomicoController@index');
 Route::post('/economico/registrar','ComponenteEconomicoController@store');
 Route::put('/economico/actualizar','ComponenteEconomicoController@update');

Route::get('/cultivo','CultivoController@indexapi');
Route::post('/cultivo/registrar','CultivoController@store');
Route::put('/cultivo/actualizar','CultivoController@update');


 //Ruta Linea Base
 Route::post('/visita/registrar', 'VisitaController@store');
 Route::get("visita/{id}","VisitaController@show");
 Route::get("visitaApi","VisitaController@visitaApi");

 Route::get("app/select","SelectController@appSelects");
