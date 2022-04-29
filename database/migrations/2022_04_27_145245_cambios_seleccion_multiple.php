<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CambiosSeleccionMultiple extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de  vias ".__LINE__."\n";
        Schema::create('viasaccesos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre')->unique();
            $table->timestamps();
        });
       

        echo "Creando tabla de  vias fincas ".__LINE__."\n";
        Schema::create('viasaccesofincas', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('via_id');
            $table->unsignedInteger('finca_id');
            $table->timestamps();
        });
        Schema::table('viasaccesofincas', function (Blueprint $table) {
            $table->foreign('via_id')->references('id')->on('viasaccesos');
            $table->foreign('finca_id')->references('id')->on('fincascoms');
        });

        echo "Creando tabla de  mantenimiento area cultivo ".__LINE__."\n";
        Schema::create('mantenimientoareacultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('manteninimiento_id');
            $table->unsignedInteger('areacultivo_id');
            $table->timestamps();
        });
        Schema::table('mantenimientoareacultivos', function (Blueprint $table) {
            $table->foreign('manteninimiento_id')->references('id')->on('mantenimientoplantacions');
            $table->foreign('areacultivo_id')->references('id')->on('areacultivos');
        });

        echo "Creando tabla de  mantenimiento area cultivo ".__LINE__."\n";
        Schema::create('tipospodalaborcultivos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('tipopoda_id');
            $table->unsignedInteger('laborcultivo_id');
            $table->timestamps();
        });
        Schema::table('tipospodalaborcultivos', function (Blueprint $table) {
            $table->foreign('tipopoda_id')->references('id')->on('tipospodas');
            $table->foreign('laborcultivo_id')->references('id')->on('laborcultivos');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mantenimientoareacultivos');
        Schema::dropIfExists('tipospodalaborcultivos');
        Schema::dropIfExists('viasaccesofincas');
        Schema::dropIfExists('viasaccesos');
    }
}
