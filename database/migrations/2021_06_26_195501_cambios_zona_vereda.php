<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CambiosZonaVereda extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('componenteSocialProductors', function (Blueprint $table) {
            $table->unsignedInteger('zona_id')->default(1)->after('vereda_id'); 
        });
    
        Schema::table('componenteSocialProductors', function (Blueprint $table) {
            $table->foreign('zona_id')->references('id')->on('zonas');          
        });

        Schema::table('fincasComs', function (Blueprint $table) {
            $table->unsignedInteger('zona_id')->default(1)->after('vereda_id'); 
        });

        Schema::table('fincasComs', function (Blueprint $table) {
            $table->foreign('zona_id')->references('id')->on('zonas'); 
        });

        Schema::table('componenteEconomicos', function (Blueprint $table) {
            $table->dropForeign('finca_id');
            $table->foreign('finca_id')->references('id')->on('fincasComs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
