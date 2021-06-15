<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComcacaotCore extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de estado civil ".__LINE__."\n";
        Schema::create('estadoCivils', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        }); 

        echo "Creando tabla de vivienda ".__LINE__."\n";
        Schema::create('viviendas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        }); 
         
        echo "Creando tabla de tipoVivienda ".__LINE__."\n";
        Schema::create('tipoViviendas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de opciones ".__LINE__."\n";
        Schema::create('opcions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de asociacion ".__LINE__."\n";
        Schema::create('asociacions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de programa del estado ".__LINE__."\n";
        Schema::create('programaEstados', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de zonas ".__LINE__."\n";
        Schema::create('zonas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de parentescos ".__LINE__."\n";
        Schema::create('parentescos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });

        echo "Creando tabla de bancos ".__LINE__."\n";
        Schema::create('bancos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });
        echo "Creando tabla de  veredas comcacaot ".__LINE__."\n";
        Schema::create('veredasComs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->unsignedInteger('zona_id');
            $table->timestamps();
        });
        Schema::table('veredasComs', function (Blueprint $table) {
            $table->foreign('zona_id')->references('id')->on('zonas');
        });

        echo "Creando tabla de componente social productor ".__LINE__."\n";
        Schema::create('componenteSocialProductors', function (Blueprint $table) {
            $table->integer('id')->unsigned();
            $table->unsignedInteger('estadoCivil_id');
            $table->unsignedInteger('etnia_id');
            $table->unsignedInteger('sexo_id');
            $table->date('fechaNacimiento');
            $table->unsignedInteger('vereda_id');
            $table->unsignedInteger('vivienda_id');
            $table->unsignedInteger('tipovivienda_id');       
            $table->unsignedInteger('escolaridad_id');
            $table->unsignedinteger('carnetSalud');
            $table->unsignedinteger('discapacitado');
            $table->integer('personasAcargo');
            $table->unsignedinteger('desplazado');
            $table->unsignedInteger('asociacion_id');
            $table->unsignedInteger('programaEstado_id');
            $table->unsignedInteger('asistencia');
            $table->string('entidad')->nullable();
            $table->unsignedInteger('capacitacion');
            $table->string('temas')->nullable(); 
            $table->unsignedInteger('parentesco1')->nullable();
            $table->string('NombreP1')->nullable();
            $table->integer('ccP1')->nullable();
            $table->date('fechaNacimientoP1')->nullable();
            $table->unsignedInteger('escolaridad_idP1')->nullable();
            $table->unsignedInteger('parentesco2')->nullable();
            $table->string('NombreP2')->nullable();
            $table->integer('ccP2')->nullable();
            $table->date('fechaNacimientoP2')->nullable();
            $table->unsignedInteger('escolaridad_idP2')->nullable();
            $table->unsignedInteger('parentesco3')->nullable();
            $table->string('NombreP3')->nullable();
            $table->integer('ccP3')->nullable();
            $table->date('fechaNacimientoP3')->nullable();
            $table->unsignedInteger('escolaridad_idP3')->nullable();
            $table->unsignedInteger('parentesco4')->nullable();
            $table->string('NombreP4')->nullable();
            $table->integer('ccP4')->nullable();
            $table->date('fechaNacimientoP4')->nullable();
            $table->unsignedInteger('escolaridad_idP4')->nullable();
            $table->unsignedInteger('parentesco5')->nullable();
            $table->string('NombreP5')->nullable();
            $table->integer('ccP5')->nullable();
            $table->date('fechaNacimientoP5')->nullable();
            $table->unsignedInteger('escolaridad_idP5')->nullable();
            $table->timestamps();
            $table->foreign('id')->references('id')->on('personas')->onDelete('cascade');
        });
        Schema::table('componenteSocialProductors', function (Blueprint $table) {
            $table->foreign('estadoCivil_id')->references('id')->on('estadoCivils');
            $table->foreign('etnia_id')->references('id')->on('etnias');
            $table->foreign('sexo_id')->references('id')->on('sexos');
            $table->foreign('vereda_id')->references('id')->on('veredasComs');
            $table->foreign('vivienda_id')->references('id')->on('viviendas');
            $table->foreign('tipoVivienda_id')->references('id')->on('tipoViviendas');
            $table->foreign('escolaridad_id')->references('id')->on('gradoEscolaridads');
            $table->foreign('carnetSalud')->references('id')->on('opcions');
            $table->foreign('discapacitado')->references('id')->on('opcions');
            $table->foreign('desplazado')->references('id')->on('opcions');
            $table->foreign('asociacion_id')->references('id')->on('asociacions');
            $table->foreign('programaEstado_id')->references('id')->on('programaEstados');
            $table->foreign('asistencia')->references('id')->on('opcions');
            $table->foreign('capacitacion')->references('id')->on('opcions');
            $table->foreign('parentesco1')->references('id')->on('parentescos');
            $table->foreign('escolaridad_idP1')->references('id')->on('gradoEscolaridads');
            $table->foreign('parentesco2')->references('id')->on('parentescos');
            $table->foreign('escolaridad_idP2')->references('id')->on('gradoEscolaridads');
            $table->foreign('parentesco3')->references('id')->on('parentescos');
            $table->foreign('escolaridad_idP3')->references('id')->on('gradoEscolaridads');
            $table->foreign('parentesco4')->references('id')->on('parentescos');
            $table->foreign('escolaridad_idP4')->references('id')->on('gradoEscolaridads');
            $table->foreign('parentesco5')->references('id')->on('parentescos');
            $table->foreign('escolaridad_idP5')->references('id')->on('gradoEscolaridads');
        });

        echo "Creando tabla de componente economico ".__LINE__."\n";
        Schema::create('componenteEconomicos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->integer('ingresoMensual');
            $table->integer('gastoMensual');
            $table->integer('otrosIngresos');
            $table->integer('ingresoNeto');
            $table->unsignedinteger('credito');
            $table->unsignedinteger('banco_id')->nullable();
            $table->unsignedinteger('ahorro');
            $table->unsignedinteger('ahorro_id')->nullable();
            $table->string('registro'); 
            $table->unsignedinteger('accionista');         
            $table->integer('numeroAcciones')->nullable();
            $table->unsignedinteger('interesadoCompra');                     
            $table->timestamps();
        });

        Schema::table('componenteEconomicos', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componenteSocialProductors');
            $table->foreign('finca_id')->references('id')->on('fincas');
            $table->foreign('credito')->references('id')->on('opcions');
            $table->foreign('banco_id')->references('id')->on('bancos');
            $table->foreign('ahorro')->references('id')->on('opcions');
            $table->foreign('ahorro_id')->references('id')->on('bancos');
            $table->foreign('accionista')->references('id')->on('opcions');
            $table->foreign('interesadoCompra')->references('id')->on('opcions');
        });



       



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('componenteSocialProductors');
        Schema::dropIfExists('componenteEconomicos');
        Schema::dropIfExists('estadoCivils');
        Schema::dropIfExists('viviendas');
        Schema::dropIfExists('tipoViviendas');
        Schema::dropIfExists('opcions');
        Schema::dropIfExists('asociacions');
        Schema::dropIfExists('programaEstados');
        Schema::dropIfExists('veredasComs');
        Schema::dropIfExists('zonas');
        Schema::dropIfExists('parentescos');
        Schema::dropIfExists('bancos');

    }
}
