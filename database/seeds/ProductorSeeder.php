<?php

use Illuminate\Database\Seeder;

class ProductorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        echo "Iniciando ejecuion de Seeder " . __CLASS__ . "\n";

        echo "Creando estado civil - Line:" . __LINE__ . "\n";
        \App\EstadoCivil::create([
            'nombre' => 'Soltero',            
        ]);
        \App\EstadoCivil::create([
            'nombre' => 'Casado',
        ]);

        echo "Creando viviendas - Line:" . __LINE__ . "\n";
        $viviendas = array(
            ["nombre" => "Propia"],
            ["nombre" => "Arriendo"],
            ["nombre" => "Prestada"],
        );

        foreach ($viviendas as $vivienda){
            \App\Vivienda::create([
                'nombre' => $vivienda['nombre']
            ]);
        }

        echo "Creando tipo vivienda - Line:" . __LINE__ . "\n";

        $tiposVivienda = array(
            ['nombre' => 'Madera'],
            ['nombre' => 'Cemento'],
            ['nombre' => 'Otro'],
        );

        foreach ($tiposVivienda as $tipo) {
            \App\TipoVivienda::create([
                'nombre' => $tipo['nombre']
            ]);
        }

        echo "Creando opciones - Line:" . __LINE__ . "\n";

        $opciones = array(
            ['nombre' => 'SI'],
            ['nombre' => 'NO'],

        );

        foreach ($opciones as $opcion) {
            \App\Opcion::create([
                'nombre' => $opcion['nombre']
            ]);
        }

        echo "Creando programa estado - Line:" . __LINE__ . "\n";

        $programas = array(
            ['nombre' => 'Familia en accion'],
            ['nombre' => 'Adulto Mayor'],
            ['nombre' => 'Desplazado'],
            ['nombre' => 'Otro'],
            ['nombre' => 'No tiene acceso'],
        );

        foreach ($programas as $programa) {
            \App\ProgramaEstado::create([
                'nombre' => $programa['nombre']
            ]);
        }

        echo "Creando zonas - Line:" . __LINE__ . "\n";

        $zonas = array(
            ['nombre' => 'Ensenada'],
            ['nombre' => 'Bajo Mira'],
            ['nombre' => 'Alto Mira'],
            ['nombre' => 'Rio Rosario'],
            ['nombre' => 'Rio Chagui'],
            ['nombre' => 'Carretera'],
        );

        foreach ($zonas as $zona) {
            \App\Zona::create([
                'nombre' => $zona['nombre']
            ]);
        }

        echo "Creando parentescos - Line:" . __LINE__ . "\n";

        $parentescos = array(
            ['nombre' => 'Conyuge'],
            ['nombre' => 'Suegro'],
            ['nombre' => 'Hijo'],
            ['nombre' => 'Abuelo'],
            ['nombre' => 'Hermano'],
            ['nombre' => 'Otro'],
        );

        foreach ($parentescos as $parentesco) {
            \App\Parentesco::create([
                'nombre' => $parentesco['nombre']
            ]);
        }


        echo "Creando bancos - Line:" . __LINE__ . "\n";

        $bancos = array(
            ['nombre' => 'BANCO DE COLOMBIA'],
            ['nombre' => 'BANCO DE BOGOTA'],
            ['nombre' => 'BANCO AGRARIO'],
            ['nombre' => 'DAVIVIENDA'],
            ['nombre' => 'BAN COMPARTIR'],
            ['nombre' => 'BANCO DE LA MUJER WWB'],
            ['nombre' => 'BANCAMIA'],
            ['nombre' => 'OTRO'],
        );

        foreach ($bancos as $banco) {
            \App\Banco::create([
                'nombre' => $banco['nombre']
            ]);
        }

        echo "Creando asociaciones - Line:" . __LINE__ . "\n";

        $asociaciones = array(
            ['nombre' => 'AGROFROTERA'],
            ['nombre' => 'AGROFROTERAS'],
            ['nombre' => 'AGROFORTALEZA'],
            ['nombre' => 'AGROJUNTOS VENCEREMOS'],
            ['nombre' => 'AGROFUTURO'],
            ['nombre' => 'AGRONUEVA ESPERANZA'],
            ['nombre' => 'AGROPINDALES'],
            ['nombre' => 'AGROSAN'],
            ['nombre' => 'ASOANES'],
            ['nombre' => 'ASOREMB'],
            ['nombre' => 'ASOCHAJAL'],
            ['nombre' => 'ASOFUTURO'],
            ['nombre' => 'ASOPALMIRA'],
            ['nombre' => 'ASOPORCA'],
            ['nombre' => 'ASOPROGRESO'],
            ['nombre' => 'ASUPRO'],
            ['nombre' => 'CACAUTEROS DEL FUTURO'],
            ['nombre' => 'LA ESPERANZA'],
            ['nombre' => 'PROCACAO'],
            ['nombre' => 'ASOCAMPO'],
        );

        foreach ($asociaciones as $asociacion) {
            \App\Asociacion::create([
                'nombre' => $asociacion['nombre']
            ]);
        }

        

        echo "Creando VeredasComs - Line:" . __LINE__ . "\n";

        $veredas = array(
            ['nombre' => 'Alto Buenos Aires','zona_id'=>'1'],
            ['nombre' => 'Caleta Viento Libre','zona_id'=>'1'],
            ['nombre' => 'La Concha (Tablón Salado)','zona_id'=>'1'],
            ['nombre' => 'Yanaje','zona_id'=>'1'],
            ['nombre' => 'Guayabo','zona_id'=>'1'],
            ['nombre' => 'Bajos Buenos Aires (Tablón Salado)','zona_id'=>'1'],
            ['nombre' => 'Barro Colarado (Gualajo)','zona_id'=>'1'],
            ['nombre' => 'Boca de Curay','zona_id'=>'1'],
            ['nombre' => 'Colorado','zona_id'=>'1'],
            ['nombre' => 'El Guabal (río Gualajo)','zona_id'=>'1'],
            ['nombre' => 'El Retomo','zona_id'=>'1'],
            ['nombre' => 'Gualajo (San Angustín)','zona_id'=>'1'],
            ['nombre' => 'Imbilpí del Carmen','zona_id'=>'1'],
            ['nombre' => 'La Chorrera Curay','zona_id'=>'1'],
            ['nombre' => 'Salahonda(Francisco Pizarro)','zona_id'=>'1'],
            ['nombre' => 'San Antonio','zona_id'=>'1'],
            ['nombre' => 'San Antonio de Curay','zona_id'=>'1'],
            ['nombre' => 'San Juan ( de la costa)','zona_id'=>'1'],
            ['nombre' => 'Santa Rosa','zona_id'=>'1'],
            ['nombre' => 'Soledad','zona_id'=>'1'],
            ['nombre' => 'Tablón Dulce','zona_id'=>'1'],
            ['nombre' => 'Trujillo','zona_id'=>'1'],
            ['nombre' => 'Alto Santo Domingo','zona_id'=>'2'],
            ['nombre' => 'Bajo Jagua','zona_id'=>'2'],
            ['nombre' => 'Brisas del Acueducto','zona_id'=>'2'],
            ['nombre' => 'Cabo Manglares','zona_id'=>'2'],
            ['nombre' => 'El Barranco','zona_id'=>'2'],
            ['nombre' => 'El Guachal','zona_id'=>'2'],
            ['nombre' => 'Milagros','zona_id'=>'2'],
            ['nombre' => 'Terán','zona_id'=>'2'],
            ['nombre' => 'Sagumbita','zona_id'=>'2'],
            ['nombre' => 'Bocas de Cajapí','zona_id'=>'2'],
            ['nombre' => 'Alto Jagua','zona_id'=>'2'],
            ['nombre' => 'Bajo  Santo Domingo','zona_id'=>'2'],
            ['nombre' => 'Bocas del Guabal','zona_id'=>'2'],
            ['nombre' => 'Cacagual','zona_id'=>'2'],
            ['nombre' => 'Chontal','zona_id'=>'2'],
            ['nombre' => 'Congal','zona_id'=>'2'],
            ['nombre' => 'Delcolgadero','zona_id'=>'2'],
            ['nombre' => 'El Jagua','zona_id'=>'2'],
            ['nombre' => 'Guachal','zona_id'=>'2'],
            ['nombre' => 'Imbili la Loma','zona_id'=>'2'],
            ['nombre' => 'Las Vegas','zona_id'=>'2'],
            ['nombre' => 'Miras Palma','zona_id'=>'2'],
            ['nombre' => 'Paisurero','zona_id'=>'2'],
            ['nombre' => 'Puerto Palma','zona_id'=>'2'],
            ['nombre' => 'San Isidro','zona_id'=>'2'],
            ['nombre' => 'Viguaral','zona_id'=>'2'],
            ['nombre' => 'Vuelta del Carmen','zona_id'=>'2'],
            ['nombre' => 'Alto San Agustín','zona_id'=>'3'],
            ['nombre' => 'La Balsa (río Mira)','zona_id'=>'3'],
            ['nombre' => 'Pianipí','zona_id'=>'3'],
            ['nombre' => 'Vuelta de Candelilla','zona_id'=>'3'],
            ['nombre' => 'Achotal','zona_id'=>'3'],
            ['nombre' => 'Alto Pañambí','zona_id'=>'3'],
            ['nombre' => 'Bajo Pusbí','zona_id'=>'3'],
            ['nombre' => 'Bayanviendo','zona_id'=>'3'],
            ['nombre' => 'Casas Viejas','zona_id'=>'3'],
            ['nombre' => 'Divorcio','zona_id'=>'3'],
            ['nombre' => 'La Aduana','zona_id'=>'3'],
            ['nombre' => 'La Honda','zona_id'=>'3'],
            ['nombre' => 'La Loma','zona_id'=>'3'],
            ['nombre' => 'La Piñuela','zona_id'=>'3'],
            ['nombre' => 'Las Brisas','zona_id'=>'3'],
            ['nombre' => 'Mata Platano','zona_id'=>'3'],
            ['nombre' => 'Mataje','zona_id'=>'3'],
            ['nombre' => 'Mirapalmas','zona_id'=>'3'],
            ['nombre' => 'Mugui','zona_id'=>'3'],
            ['nombre' => 'Palo Seco','zona_id'=>'3'],
            ['nombre' => 'Peña Colorada','zona_id'=>'3'],
            ['nombre' => 'Pital','zona_id'=>'3'],
            ['nombre' => 'Playa del Mira (Casas Viejas)','zona_id'=>'3'],
            ['nombre' => 'Playón (río Mira)','zona_id'=>'3'],
            ['nombre' => 'Puerto Rico','zona_id'=>'3'],
            ['nombre' => 'Rastrojada','zona_id'=>'3'],
            ['nombre' => 'Restrepo','zona_id'=>'3'],
            ['nombre' => 'San Juan','zona_id'=>'3'],
            ['nombre' => 'Sonadora','zona_id'=>'3'],
            ['nombre' => 'Tandil','zona_id'=>'3'],
            ['nombre' => 'Tangareal del Mira','zona_id'=>'3'],
            ['nombre' => 'Tiesteria','zona_id'=>'3'],
            ['nombre' => 'Tulmo','zona_id'=>'3'],
            ['nombre' => 'Ambulpí','zona_id'=>'4'],
            ['nombre' => 'Bajo Caunapí - La Vega','zona_id'=>'4'],
            ['nombre' => 'Cacagual de Las Varas','zona_id'=>'4'],
            ['nombre' => 'Candelo','zona_id'=>'4'],
            ['nombre' => 'Chapilar','zona_id'=>'4'],
            ['nombre' => 'Chorrera ','zona_id'=>'4'],
            ['nombre' => 'Corriente Grande','zona_id'=>'4'],
            ['nombre' => 'El Coco','zona_id'=>'4'],
            ['nombre' => 'Isla Grande','zona_id'=>'4'],
            ['nombre' => 'lscuandé','zona_id'=>'4'],
            ['nombre' => 'Peña de Los Santos','zona_id'=>'4'],
            ['nombre' => 'San Francisco','zona_id'=>'4'],
            ['nombre' => 'Vuelta Larga','zona_id'=>'4'],
            ['nombre' => 'Alto Palmarreal','zona_id'=>'5'],
            ['nombre' => 'Boca de Salisbi','zona_id'=>'5'],
            ['nombre' => 'Chajal','zona_id'=>'5'],
            ['nombre' => 'Chapul','zona_id'=>'5'],
            ['nombre' => 'Cuarazanga','zona_id'=>'5'],
            ['nombre' => 'El Guadual','zona_id'=>'5'],
            ['nombre' => 'La Chorrera','zona_id'=>'5'],
            ['nombre' => 'La Junta','zona_id'=>'5'],
            ['nombre' => 'Las Mercedes','zona_id'=>'5'],
            ['nombre' => 'Limones','zona_id'=>'5'],
            ['nombre' => 'Majagua','zona_id'=>'5'],
            ['nombre' => 'Nueva Vista','zona_id'=>'5'],
            ['nombre' => 'Pácora','zona_id'=>'5'],
            ['nombre' => 'Palambí','zona_id'=>'5'],
            ['nombre' => 'Palay','zona_id'=>'5'],
            ['nombre' => 'Salisví','zona_id'=>'5'],
            ['nombre' => 'San Pedro','zona_id'=>'5'],
            ['nombre' => 'Yanovi','zona_id'=>'5'],
            ['nombre' => 'Albania','zona_id'=>'6'],
            ['nombre' => 'Cajapí','zona_id'=>'6'],
            ['nombre' => 'Agua Clara','zona_id'=>'6'],
            ['nombre' => 'Kilómetro 28','zona_id'=>'6'],
            ['nombre' => 'Progreso','zona_id'=>'6'],
            ['nombre' => 'Pueblo Nuevo','zona_id'=>'6'],
            ['nombre' => 'Kilómetro 35','zona_id'=>'6'],
            ['nombre' => 'Kilómetro 41','zona_id'=>'6'],
            ['nombre' => 'Kilómetro 88','zona_id'=>'6'],
            ['nombre' => 'Chilvicito','zona_id'=>'6'],
            ['nombre' => 'Dos Quebradas (Río Caunapí)','zona_id'=>'6'],
            ['nombre' => 'Pulgande','zona_id'=>'6'],
            ['nombre' => 'El Carmen Kilómetro 36','zona_id'=>'6'],
            ['nombre' => 'Robles','zona_id'=>'6'],
            ['nombre' => 'El Carmen Kilómetro 63','zona_id'=>'6'],
            ['nombre' => 'La Guayacana','zona_id'=>'6'],
            ['nombre' => 'Chilví','zona_id'=>'6'],
            ['nombre' => 'El Gualtal','zona_id'=>'6'],
            ['nombre' => 'Baquería Carretera','zona_id'=>'6'],
            ['nombre' => 'San Pablo','zona_id'=>'6'],
            ['nombre' => 'Bajo Zapotal','zona_id'=>'6'],
            ['nombre' => 'Llorente','zona_id'=>'6'],
            ['nombre' => 'Mascarey','zona_id'=>'6'],
            ['nombre' => 'Bucheli','zona_id'=>'6'],
            ['nombre' => 'Retoño','zona_id'=>'6'],
            ['nombre' => 'Espriella','zona_id'=>'6'],
            ['nombre' => 'Candelillas','zona_id'=>'6'],
            ['nombre' => 'Brava','zona_id'=>'6'],
            ['nombre' => 'Inguapi la Chiricana','zona_id'=>'6'],
            ['nombre' => 'Pindales','zona_id'=>'6'],
            ['nombre' => 'Inguapí del Carmen','zona_id'=>'6'],
            ['nombre' => 'Zabaleta (Caserío Bajo Inda)','zona_id'=>'6'],
            ['nombre' => 'Caunapí Km-60','zona_id'=>'6'],
            ['nombre' => 'Inguapí del Guadual','zona_id'=>'6'],
            ['nombre' => 'Piguambí','zona_id'=>'6'],
            ['nombre' => 'Ceibito','zona_id'=>'6'],
            ['nombre' => 'Juan Domingo','zona_id'=>'6'],
            ['nombre' => 'Nueva Reforma','zona_id'=>'6'],
            ['nombre' => 'Nueva Creación','zona_id'=>'6'],
            ['nombre' => 'Pital Piragua','zona_id'=>'6'],
            ['nombre' => 'Jorge H. Leal K. 38','zona_id'=>'6'],
            ['nombre' => 'Nueva Brisa','zona_id'=>'6'],
            ['nombre' => 'Cortadura','zona_id'=>'6'],
            ['nombre' => 'La Nueva Unión','zona_id'=>'6'],
            ['nombre' => 'Tangareal','zona_id'=>'6'],
            ['nombre' => 'Aguacate','zona_id'=>'6'],
            ['nombre' => 'Km-31','zona_id'=>'6'],
            ['nombre' => 'Km-33','zona_id'=>'6'],
            ['nombre' => 'Km-34','zona_id'=>'6'],
            ['nombre' => 'Pambil- Km43','zona_id'=>'6'],
            ['nombre' => 'Alto Villarrica','zona_id'=>'6'],
            ['nombre' => 'Bajo Villarrica','zona_id'=>'6'],
            ['nombre' => 'Imbili Carretera','zona_id'=>'6'],
            ['nombre' => 'La Nupa','zona_id'=>'6'],
            ['nombre' => 'Porvenir','zona_id'=>'6'],
        );

        foreach ($veredas as $vereda) {
            \App\VeredaCom::create([
                'nombre' => $vereda['nombre'],
                'zona_id' => $vereda['zona_id']
            ]);
        }

        


    }
}