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
     Route::get('/cadena/selectCadena','CadenaController@selectCadena');
     Route::get('/lugarVenta/selectLugarVenta','LugarVentaController@selectLugarVenta');
     Route::get('/banco/selectBanco','BancoController@selectBanco');
     
     Route::get('/linea/selectLinea2','LineaController@selectLinea2');
     Route::get('/lugarVenta/selectLugarVenta2','LugarVentaController@selectLugarVenta2');
     Route::get('/equipoAplicacion/selectEquipo','EquipoAplicacionController@selectEquipo');
     Route::get('/metodoAplicacion/selectMetodo','EquipoAplicacionController@selectMetodo');
     Route::get('/unidadAplicacion/selectUnidad','EquipoAplicacionController@selectUnidad');
     Route::get('/unidadDosis/selectDosis','EquipoAplicacionController@selectDosis');
     Route::get('/producto/selectProducto2','EquipoAplicacionController@selectProducto2');

    //Ruta Backup
    Route::get('/backup', 'BackupController@backupDatabase');
    
    
     //Rutas Encuesta fitosanitaria
     Route::get('/fitosanitaria', 'EncuestaFitosanitariaController@index');
     Route::post('/fitosanitaria/registrar', 'EncuestaFitosanitariaController@store');
     Route::get('/fitosanitaria/id', 'EncuestaFitosanitariaController@MostrarId');


     //Rutas Encuesta asofrut
     Route::get('/visita', 'EncuestaAsofrutController@index');
     Route::post('/visita/registrar', 'EncuestaAsofrutController@store');

     //Caracterizacion predio cultivo
     Route::get('/predio', 'PredioCultivoController@index');
     Route::post('/predio/registrar', 'PredioCultivoController@store');

    //Caracterizacion podas
    Route::get('/poda', 'PodaController@index');
     Route::post('/poda/registrar', 'PodaController@store');
    
    //Caracterizacion plagas
    Route::get('/plaga', 'PlagaController@index');
    Route::post('/plaga/registrar', 'PlagaController@store');

    //Caracterizacion nutricion
    Route::get('/nutricion', 'NutricionController@index');
    Route::post('/nutricion/registrar', 'NutricionController@store');

    //Caracterizacion tutorado
    Route::get('/tutorado', 'TutoradoController@index');
    Route::post('/tutorado/registrar', 'TutoradoController@store');

    //Caracterizacion riego
    Route::get('/riego', 'RiegoController@index');
    Route::post('/riego/registrar', 'RiegoController@store');

    //Caracterizacion practica
     Route::get('/practica', 'PracticaController@index');
     Route::post('/practica/registrar', 'PracticaController@store');

     //Caracterizacion vocacion
     Route::get('/vocacion', 'VocacionController@index');
     Route::post('/vocacion/registrar', 'VocacionController@store');

     //Caracterizacion suelo
     Route::get('/suelo', 'SueloController@index');
     Route::post('/suelo/registrar', 'SueloController@store');

    //Caracterizacion cosechas
    Route::get('/cosecha', 'CosechaController@index');
    Route::post('/cosecha/registrar', 'CosechaController@store');

    Route::post('/formSubmit','GpxUploadController@formSubmit');

     Route::group(['middleware'=>['Productor']],function(){
        Route::get('/cultivoP','CultivoController@indexProductor');   
        Route::get('/productorP','ProductorController@indexProductor');
        Route::get('/fincaP','FincaController@indexProductor');
        Route::get('/ventaP','ventaController@indexProductor');
       });

       Route::group(['middleware'=>['Contador']],function(){
        Route::put('/venta/pasarFacturacion', 'VentaController@pasarFacturacion');    
        Route::put('/venta/pasarDisponiblePago', 'VentaController@pasarDisponiblePago');    
        Route::put('/venta/pasarPagado', 'VentaController@pasarPagado'); 
        Route::get('/venta', 'VentaController@index');       
        });
  

    Route::group(['middleware'=>['Administrador']],function(){
        Route::post('/formSubmit','GpxUploadController@formSubmit');
        Route::get('/gps','GpxUploadController@index');

     //Ruta productor fitosanitarios   
     Route::post('/fitosanitario/registrar','ProductoFitosanitarioController@store');
     Route::put('/fitosanitario/actualizar','ProductoFitosanitarioController@update');
     Route::get('/fitosanitario','ProductoFitosanitarioController@index');
   
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

    //Rutas Cultivos
    Route::get('/cultivo','CultivoController@index');
    Route::post('/cultivo/registrar','CultivoController@store');
    Route::put('/cultivo/actualizar','CultivoController@update');    

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
     Route::post('/productor/registrar','ComponenteSocialProductorController@store');
     Route::put('/productor/actualizar','ComponenteSocialProductorController@update');
     
     Route::get('/economico','ComponenteEconomicoController@index');
     Route::post('/economico/registrar','ComponenteEconomicoController@store');
     Route::put('/economico/actualizar','ComponenteEconomicoController@update');
     
     //Rutas roles
     Route::get('/rol','RolController@index');
     Route::get('/rol/selectRol','RolController@selectRol');
     
     //Rutas usuarios
     Route::get('/user','UserController@index');
     Route::post('/user/registrar','UserController@store');
     Route::put('/user/actualizar','UserController@update');
     Route::put('/user/desactivar','UserController@desactivar');
     Route::put('/user/activar','UserController@activar');

    Route::get('/categoria','CategoriaController@index');
    Route::post('/categoria/registrar','CategoriaController@store');
    Route::put('/categoria/actualizar','CategoriaController@update');
    Route::put('/categoria/desactivar','CategoriaController@desactivar');
    Route::put('/categoria/activar','CategoriaController@activar');
    Route::get('/categoria/selectCategoria','CategoriaController@selectCategoria');
    
    
    Route::get('/articulo','ArticuloController@index');
    Route::post('/articulo/registrar','ArticuloController@store');
    Route::put('/articulo/actualizar','ArticuloController@update');
    Route::put('/articulo/desactivar','ArticuloController@desactivar');
    Route::put('/articulo/activar','ArticuloController@activar');
    
    Route::get('/cliente','ClienteController@index');
    Route::post('/cliente/registrar','ClienteController@store');
    Route::put('/cliente/actualizar','ClienteController@update');
    
    Route::get('/proveedor','ProveedorController@index');
    Route::post('/proveedor/registrar','ProveedorController@store');
    Route::put('/proveedor/actualizar','ProveedorController@update');
    });


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
    
     //Rutas Categoria Moras
    Route::get('/categoriaMora','CategoriaMoraController@index');
    Route::get('/categoriaMora/buscarCategoria','CategoriaMoraController@buscarCategoria');
    Route::get('/categoriaMora/listarCategoria','CategoriaMoraController@listarCategoria');      
    });

    Route::group(['middleware'=>['TecnicoExtensionista']],function(){
        
        
        //Rutas Cultivos
        Route::get('/cultivo','CultivoController@index');
        Route::post('/cultivo/registrar','CultivoController@store');
        Route::put('/cultivo/actualizar','CultivoController@update'); 

      
    });

    

    
    
    
    
   
});    

//Route::get('/home', 'HomeController@index')->name('home');
