<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VentaCategoriaCom extends Model
{
    protected $table = 'ventas_categoriacoms';
    protected $fillable = ['ventas_id','categoria_id','peso','humedad','fermentacion',
    'descuentoHumedadKg','valorUnitario','subtotal'
                            ];

    public function venta(){
        return $this->belongsTo('App\VentaCom','ventas_id','id');
    }
    public function lugarVenta(){
        return $this->belongsTo('App\CategoriaMora','categoria_id','id');
    }
}
