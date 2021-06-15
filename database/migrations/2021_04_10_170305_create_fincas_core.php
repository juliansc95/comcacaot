<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFincasCore extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de fincas comcacaot ".__LINE__."\n";
        Schema::create('fincasComs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->unsignedInteger('productor_id');
            $table->date('fechaRegistro');
            $table->string('telefono');
            $table->unsignedInteger('departamento_id');
            $table->unsignedInteger('municipio_id');
            $table->unsignedInteger('vereda_id');
            $table->decimal('areaTotal', 11, 2);
            $table->string('viasAcceso');
            $table->decimal('latitud', 11, 6);
            $table->decimal('longitud', 11, 6);         
            $table->decimal('altitud', 11, 2);
            $table->unsignedInteger('posesion_id');               
            $table->timestamps();
        });

        Schema::table('fincasComs', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('departamento_id')->references('id')->on('departamentos');
            $table->foreign('municipio_id')->references('id')->on('municipios');
            $table->foreign('vereda_id')->references('id')->on('veredascoms');
            $table->foreign('posesion_id')->references('id')->on('posesions');
        });

        echo "Creando tabla tipos mantenimientos plantacion ".__LINE__."\n";
        Schema::create('mantenimientoPlantacions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla tipos de poda ".__LINE__."\n";
        Schema::create('tiposPodas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla estado cultivos ".__LINE__."\n";
        Schema::create('estadoCultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla fuente de financiacion ".__LINE__."\n";
        Schema::create('financiacions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        
        echo "Creando tabla tipos control enfermedades".__LINE__."\n";
        Schema::create('tipoControls', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla fermentacion".__LINE__."\n";
        Schema::create('fermentacions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla residuos solidos".__LINE__."\n";
        Schema::create('residuosSolidos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });


        echo "Creando tabla de area cultivo cacao ".__LINE__."\n";
        Schema::create('areaCultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->decimal('areaTotalCultivo', 11, 2);
            $table->integer('edadCultivo');
            $table->integer('criollo');
            $table->integer('CCN51');
            $table->integer('ICS95');
            $table->integer('otros');
            $table->unsignedInteger('injertado');
            $table->integer('variedadcriollo');
            $table->integer('variedadCCN51');
            $table->integer('variedadICS95');
            $table->integer('variedadotros');
            $table->integer('arbolesProduccion');
            $table->unsignedInteger('estado_id');
            $table->unsignedInteger('mantenimiento_id'); 
            $table->timestamps();
        });

        Schema::table('areaCultivos', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('finca_id')->references('id')->on('fincasComs');
            $table->foreign('injertado')->references('id')->on('opcions');
            $table->foreign('mantenimiento_id')->references('id')->on('mantenimientoPlantacions');
            $table->foreign('estado_id')->references('id')->on('estadoCultivos');
        });

        echo "Creando tabla de labor cultivo cacao ".__LINE__."\n";
        Schema::create('laborCultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->unsignedInteger('control');
            $table->string('metodo');
            $table->string('observacionMetodo');
            $table->unsignedInteger('poda_id');
            $table->string('observacionPoda');
            $table->string('drenaje');
            $table->unsignedInteger('estado_id');
            $table->string('fertilizacion');
            $table->integer('fertilizacionTiempo');
            $table->unsignedInteger('financiacion_id');
            $table->integer('frecuenciaFertilizacion');
            $table->unsignedInteger('controlEnfermedades');
            $table->unsignedInteger('tipoControlEnfermedad');
            $table->string('observacionEnfermedad');
            $table->unsignedInteger('controlPlagas');
            $table->unsignedInteger('tipoControlPlagas');
            $table->string('observacionPlaga');
            $table->timestamps();
        });

        Schema::table('laborCultivos', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('finca_id')->references('id')->on('fincasComs');
            $table->foreign('control')->references('id')->on('opcions');
            $table->foreign('poda_id')->references('id')->on('tiposPodas');
            $table->foreign('estado_id')->references('id')->on('estadoCultivos');
            $table->foreign('financiacion_id')->references('id')->on('financiacions');
            $table->foreign('controlEnfermedades')->references('id')->on('opcions');
            $table->foreign('tipoControlEnfermedad')->references('id')->on('tipoControls');
            $table->foreign('controlPlagas')->references('id')->on('opcions');
            $table->foreign('tipoControlPlagas')->references('id')->on('tipoControls');
        });


        
        echo "Creando tabla de cosecha cultivo cacao ".__LINE__."\n";
        Schema::create('cosechaCultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->string('frecuencia');     
            $table->integer('frescoTotal');
            $table->integer('secoTotal');
            $table->unsignedInteger('beneficio');
            $table->unsignedInteger('fermentacion_id');
            $table->integer('frescoTotalMes');
            $table->integer('secoTotalMes');
            $table->unsignedInteger('lugarVenta_id');
            $table->timestamps();
        });

        Schema::table('cosechaCultivos', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('finca_id')->references('id')->on('fincasComs');
            $table->foreign('beneficio')->references('id')->on('opcions');
            $table->foreign('fermentacion_id')->references('id')->on('fermentacions');
            $table->foreign('lugarVenta_id')->references('id')->on('lugarventas');
        });

        echo "Creando tabla de manejo ambiental ".__LINE__."\n";
        Schema::create('manejoAmbientals', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->unsignedInteger('distanciaFuentes');
            $table->unsignedInteger('residuo_id');
            $table->unsignedInteger('erosion');
            $table->unsignedInteger('proteccion');
            $table->unsignedInteger('agroquimico');
            $table->unsignedInteger('fauna');
            $table->timestamps();
        });
        Schema::table('manejoAmbientals', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('finca_id')->references('id')->on('fincasComs');
            $table->foreign('distanciaFuentes')->references('id')->on('opcions');
            $table->foreign('residuo_id')->references('id')->on('residuosSolidos');
            $table->foreign('erosion')->references('id')->on('opcions');
            $table->foreign('proteccion')->references('id')->on('opcions');
            $table->foreign('agroquimico')->references('id')->on('opcions');
            $table->foreign('fauna')->references('id')->on('opcions');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fincasComs');
        Schema::dropIfExists('mantenimientoPlantacions');
        Schema::dropIfExists('tiposPodas');
        Schema::dropIfExists('estadoCultivos');
        Schema::dropIfExists('financiacions');
        Schema::dropIfExists('tipoControls');
        Schema::dropIfExists('fermentacions');
        Schema::dropIfExists('residuosSolidos');
        Schema::dropIfExists('areaCultivos');
        Schema::dropIfExists('laborCultivos');
        Schema::dropIfExists('cosechaCultivos');
        Schema::dropIfExists('manejoAmbientals');
    }
}
