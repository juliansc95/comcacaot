<?php

use Illuminate\Database\Seeder;

class FincaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        echo "Iniciando ejecuion de Seeder " . __CLASS__ . "\n";

        echo "Creando mantenimientos plantacion - Line:" . __LINE__ . "\n";
        $mantenimientos = array(
            ["nombre" => "Poda"],
            ["nombre" => "Drenaje"],
            ["nombre" => "Sombrio"],
            ["nombre" => "Fertilizacion"],
            ["nombre" => "Enmalezado"],
            ["nombre" => "Fitosanitario"],
        );

        foreach ($mantenimientos as $mantenimiento){
            \App\MantenimientoPlantacion::create([
                'nombre' => $mantenimiento['nombre']
            ]);
        }

        echo "Creando tipos poda - Line:" . __LINE__ . "\n";

        $tiposPoda = array(
            ['nombre' => 'Formacion'],
            ['nombre' => 'Mantenimiento'],
            ['nombre' => 'Rehabilitacion'],
            ['nombre' => 'Ninguna'],
        );

        foreach ($tiposPoda as $tipo) {
            \App\TiposPoda::create([
                'nombre' => $tipo['nombre']
            ]);
        }

        echo "Creando estado cultivo - Line:" . __LINE__ . "\n";

        $estados = array(
            ['nombre' => 'Bueno'],
            ['nombre' => 'Regular'],
            ['nombre' => 'Malo'],
        );

        foreach ($estados as $estado) {
            \App\EstadoCultivo::create([
                'nombre' => $estado['nombre']
            ]);
        }

        echo "Creando fuentes de financiacion- Line:" . __LINE__ . "\n";

        $financiacions = array(
            ['nombre' => 'Recurso Propio '],
            ['nombre' => 'Credito'],
            ['nombre' => 'Alcaldia'],
            ['nombre' => 'Proyecto'],
        );

        foreach ($financiacions as $financiacion) {
            \App\Financiacion::create([
                'nombre' => $financiacion['nombre']
            ]);
        }

        echo "Creando tipos de control- Line:" . __LINE__ . "\n";

        $controls = array(
            ['nombre' => 'Quimico '],
            ['nombre' => 'Organico'],
            ['nombre' => 'Cultural'],
            ['nombre' => 'Otros'],
        );

        foreach ($controls as $control) {
            \App\TipoControl::create([
                'nombre' => $control['nombre']
            ]);
        }

        echo "Creando tipos de fermentacion- Line:" . __LINE__ . "\n";

        $fermentacions = array(
            ['nombre' => 'Cajones '],
            ['nombre' => 'Costales'],
            ['nombre' => 'Secado'],
            ['nombre' => 'Muelle'],
            ['nombre' => 'Piso'],
            ['nombre' => 'Marquesina'],
        );

        foreach ($fermentacions as $fermentacion) {
            \App\Fermentacion::create([
                'nombre' => $fermentacion['nombre']
            ]);
        }

        echo "Creando tipos de residuos solidos- Line:" . __LINE__ . "\n";

        $residuos = array(
            ['nombre' => 'Puntos de reciclaje '],
            ['nombre' => 'Entierra'],
            ['nombre' => 'Quema'],
            ['nombre' => 'Desecho a fuentes hidricas'],
            ['nombre' => 'No maneja residuos solidos'],
        );

        foreach ($residuos as $residuo) {
            \App\ResiduosSolido::create([
                'nombre' => $residuo['nombre']
            ]);
        }

    }
}
