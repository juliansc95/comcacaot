<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware'=>['guest']],function(){
    //Rutas Login
    Route::get('/','Auth\LoginController@showLoginForm');
    Route::post('/login','Auth\LoginController@login')->name('login');
});

Route::group(['middleware'=>['auth']],function(){
  
    Route::post('/logout','Auth\LoginController@logout')->name('logout');
    Route::get('/dashboard','DashboardController');

    Route::get('/main', function () {
        return view('contenido/contenido');
    })->name('main');
    
     //Rutas de los select
     Route::get('/tipoId/selectTipoId','TipoIdController@selectTipoId');
     Route::get('/sexo/selectSexo','SexoController@selectSexo');
     Route::get('/escolaridad/selectEscolaridad','GradoEscolaridadController@selectGradoEscolaridad');
     Route::get('/etnia/selectEtnia','EtniaController@selectEtnia');
     Route::get('/departamento/selectDepartamento','DepartamentoController@selectDepartamento');
     Route::get('/municipio/selectMunicipio','MunicipioController@selectMunicipio');
     Route::get('/vereda/selectVereda','VeredaComController@selectVereda');
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
     
     Route::get('/posesion/selectPosesion','PosesionController@selectPosesion');
     Route::get('/linea/selectLinea','LineaController@selectLinea');
     Route::get('/finca/selectFinca/{id}','FincaComcacaotController@selectFinca');
     Route::get('/lugarVenta/selectLugarVenta','LugarVentaController@selectLugarVenta');
     Route::get('/banco/selectBanco','BancoController@selectBanco');
     
     Route::get('/linea/selectLinea2','LineaController@selectLinea2');
     Route::get('/lugarVenta/selectLugarVenta2','LugarVentaController@selectLugarVenta2');
   
    //Ruta Backup
    Route::get('/backup', 'BackupController@backupDatabase');
    
    //Ruta Linea Base
    Route::post('/visita/registrar', 'VisitaController@store');


     Route::group(['middleware'=>['SupervisorAgronomo']],function(){
    
    });
  

    Route::group(['middleware'=>['Administrador']],function(){
       

     
   
     //Rutas Ventas
     Route::get('/venta', 'VentaComController@index');
     Route::post('/venta/registrar', 'VentaComController@store');
     Route::put('/venta/desactivar', 'VentaComController@desactivar');
     Route::get('/venta/obtenerCabecera', 'VentaComController@obtenerCabecera');
     Route::get('/venta/obtenerDetalles', 'VentaComController@obtenerVentaCategoria');
     Route::put('/venta/pasarFacturacion', 'VentaComController@pasarFacturacion');    
     Route::put('/venta/pasarDisponiblePago', 'VentaComController@pasarDisponiblePago');    
     Route::put('/venta/pasarPagado', 'VentaComController@pasarPagado');    
     Route::get('/venta/pdf/{id}','VentaComController@pdf')->name('venta_pdf');
     Route::get('/venta/ticket/{id}','VentaComController@pdfTicket')->name('venta_pdf');
     Route::get('/venta/listarPdf','VentaComController@listarPdf')->name('ventas_pdf');
     Route::get('/venta/listarDiario','VentaComController@listarPdfDiario')->name('ventas_dia_pdf');
    

     //Rutas Lugares de Venta
     Route::get('/lugarVenta','LugarVentaController@index');
     Route::post('/lugarVenta/registrar','LugarVentaController@store');
     Route::put('/lugarVenta/actualizar','LugarVentaController@update');

    //Rutas Categoria Moras
    Route::get('/categoriaMora','CategoriaMoraController@index');
    Route::post('/categoriaMora/registrar','CategoriaMoraController@store');
    Route::put('/categoriaMora/actualizar','CategoriaMoraController@update');    
    Route::get('/categoriaMora/buscarCategoria','CategoriaMoraController@buscarCategoria');
    Route::get('/categoriaMora/listarCategoria','CategoriaMoraController@listarCategoria');  

     

     //Rutas Fincas
    Route::get('/finca','FincaComcacaotController@index');
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
     Route::get('/productor/{id}','ComponenteSocialProductorController@getProductor');
     Route::post('/productor/registrar','ComponenteSocialProductorController@store');
     Route::put('/productor/actualizar','ComponenteSocialProductorController@update');
     Route::get('/productor/zonas','ComponenteSocialProductorController@listarPdf')->name('zonas_pdf');


     Route::get('/economico','ComponenteEconomicoController@index');
     Route::post('/economico/registrar','ComponenteEconomicoController@store');
     Route::put('/economico/actualizar','ComponenteEconomicoController@update');
     
    //Rutas registro agil
    Route::post('/registro/registrar','RegistroController@store');
    Route::get('/registro','RegistroController@index');
    Route::put('/registro/actualizar','RegistroController@update');



     
     //Rutas roles
     Route::get('/rol','RolController@index');
     Route::get('/rol/selectRol','RolController@selectRol');
     
     //Rutas usuarios
     Route::get('/user','UserController@index');
     Route::post('/user/registrar','UserController@store');
     Route::put('/user/actualizar','UserController@update');
     Route::put('/user/desactivar','UserController@desactivar');
     Route::put('/user/activar','UserController@activar');

  
    
    });

    //Esta funcionando como el supervisor de ventas
    Route::group(['middleware'=>['TecnicoComercial']],function(){
    //Rutas Ventas
    Route::get('/venta', 'VentaComController@index');
    Route::post('/venta/registrar', 'VentaComController@store');
    Route::put('/venta/desactivar', 'VentaComController@desactivar');
    Route::get('/venta/obtenerCabecera', 'VentaComController@obtenerCabecera');
    Route::get('/venta/obtenerDetalles', 'VentaComController@obtenerVentaCategoria');
    Route::put('/venta/pasarFacturacion', 'VentaComController@pasarFacturacion');    
    Route::put('/venta/pasarDisponiblePago', 'VentaComController@pasarDisponiblePago');    
    Route::put('/venta/pasarPagado', 'VentaComController@pasarPagado');
    Route::get('/venta/pdf/{id}','VentaComController@pdf')->name('venta_pdf'); 
    Route::get('/venta/ticket/{id}','VentaComController@pdfTicket')->name('venta_pdf');
    
     //Rutas Categoria Moras
    Route::get('/categoriaMora','CategoriaMoraController@index');
    Route::get('/categoriaMora/buscarCategoria','CategoriaMoraController@buscarCategoria');
    Route::get('/categoriaMora/listarCategoria','CategoriaMoraController@listarCategoria');
    
    //Rutas Lugares de Venta
    Route::get('/lugarVenta','LugarVentaController@index');
    Route::post('/lugarVenta/registrar','LugarVentaController@store');
    Route::put('/lugarVenta/actualizar','LugarVentaController@update');
    });

    //Esta funcionando como tecnico de campo y supervisor agronomo
    Route::group(['middleware'=>['TecnicoExtensionista']],function(){
    
    //Rutas productores
        Route::get('/productor','ComponenteSocialProductorController@index');
        Route::post('/productor/registrar','ComponenteSocialProductorController@store');
        Route::put('/productor/actualizar','ComponenteSocialProductorController@update');
        Route::get('/productor/zonas','ComponenteSocialProductorController@listarPdf')->name('zonas_pdf');

        Route::get('/economico','ComponenteEconomicoController@index');
        Route::post('/economico/registrar','ComponenteEconomicoController@store');
        Route::put('/economico/actualizar','ComponenteEconomicoController@update');
         //Rutas Fincas
       Route::get('/finca','FincaComcacaotController@index');
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
        

      
    });

    

    
    
    
    
   
});    

//Route::get('/home', 'HomeController@index')->name('home');
