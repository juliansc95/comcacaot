<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVisitas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de visitas ".__LINE__."\n";
        Schema::create('visitas', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('finca_id');
            $table->decimal('areaProduccion', 11, 2);
            $table->decimal('siembraNueva', 11, 2);
            $table->decimal('edadCultivo', 11, 2);
            $table->decimal('arbolesSembrados', 11, 2);
            $table->decimal('produccionMensual', 11, 2);
            $table->decimal('vendidoFresco', 11, 2);
            $table->decimal('porVenderFresco', 11, 2);
            $table->decimal('vendidoSeco', 11, 2);
            $table->decimal('porVenderSeco', 11, 2);
            $table->unsignedInteger('lugarVenta_id');
            $table->string('objetivos');
            $table->string('estadoActualFinca');
            $table->string('recomendacionesTecnicoAmbientales');
            $table->string('observaciones');
            $table->integer('nivelSatisfaccionAsistencia');
            $table->integer('nivelSatisfaccionEmpresa');
            $table->integer('predecesor_id');                       
            $table->timestamps();
        });
        Schema::table('visitas', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('finca_id')->references('id')->on('fincascoms');
            $table->foreign('lugarVenta_id')->references('id')->on('lugarVentas');
        });

        echo "Creando tabla de visita_Compromisos ".__LINE__."\n";
        Schema::create('visita_Compromisos', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('visita_id');
            $table->string('compromiso');
            $table->integer('cumplimiento');
            $table->integer('predecesor_id');
            $table->timestamps();
        });

        Schema::table('visita_Compromisos', function (Blueprint $table) {
            $table->foreign('visita_id')->references('id')->on('visitas');
        });    
    }
    

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('visitas');
        Schema::dropIfExists('visita_Compromisos');
    }
}
