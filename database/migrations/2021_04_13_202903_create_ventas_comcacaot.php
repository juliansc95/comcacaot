<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVentasComcacaot extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        echo "Creando tabla de ventas ".__LINE__."\n";
        Schema::create('ventacoms', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('productor_id');
            $table->unsignedInteger('lugarVenta_id');
            $table->unsignedInteger('vereda_id');
            $table->unsignedInteger('zona_id');
            $table->date('fechaVenta');
            $table->decimal('totalKilos', 11, 2);
            $table->decimal('totalKilosNetos', 11, 2);
            $table->decimal('totalIncentivoXkg', 11, 2);
            $table->decimal('totalIncentivo', 11, 2);
            $table->decimal('totalNeto', 11, 2);
            $table->unsignedInteger('estado_id');
            $table->string('observaciones');                                 
            $table->timestamps();
        });
        Schema::table('ventacoms', function (Blueprint $table) {
            $table->foreign('productor_id')->references('id')->on('componentesocialproductors');
            $table->foreign('lugarVenta_id')->references('id')->on('lugarVentas');
            $table->foreign('vereda_id')->references('id')->on('veredascoms');
            $table->foreign('zona_id')->references('id')->on('zonas');
            $table->foreign('estado_id')->references('id')->on('estadoVentas');
        });

        echo "Creando tabla de ventas_categorias ".__LINE__."\n";
        Schema::create('ventas_categoriacoms', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('ventas_id');
            $table->unsignedInteger('categoria_id');
            $table->decimal('peso', 11, 2);
            $table->decimal('humedad', 11, 2);
            $table->decimal('fermentacion', 11, 2);
            $table->decimal('descuentoHumedadKg', 11, 2);
            $table->decimal('valorUnitario', 11, 2);
            $table->decimal('subtotal', 11, 2);
            $table->timestamps();
        });

        Schema::table('ventas_categoriacoms', function (Blueprint $table) {
            $table->foreign('ventas_id')->references('id')->on('ventacoms');
            $table->foreign('categoria_id')->references('id')->on('categoriaMoras');
        });    
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ventas_categoriacoms');
        Schema::dropIfExists('ventacoms');
    }
}
