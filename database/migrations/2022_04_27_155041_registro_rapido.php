<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RegistroRapido extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de registro rapido ".__LINE__."\n";
        Schema::create('registros', function (Blueprint $table) {
            $table->integer('id')->unsigned();
            $table->unsignedInteger('socio');
            $table->unsignedInteger('zona_id');
            $table->foreign('id')->references('id')->on('personas')->onDelete('cascade');
        });
        Schema::table('registros', function (Blueprint $table) {
            $table->foreign('socio')->references('id')->on('opcions');
            $table->foreign('zona_id')->references('id')->on('zonas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('registros');
    }
}
