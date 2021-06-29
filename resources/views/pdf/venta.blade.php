<!DOCTYPE>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reporte de venta</title>
    <style>
        body {
        /*position: relative;*/
        /*width: 16cm;  */
        /*height: 29.7cm; */
        /*margin: 0 auto; */
        /*color: #555555;*/
        /*background: #FFFFFF; */
        font-family: Arial, sans-serif; 
        font-size: 14px;
        /*font-family: SourceSansPro;*/
        }

        #logo{
        float: left;
        margin-top: 1%;
        margin-left: 2%;
        margin-right: 2%;
        }

        #imagen{
        width: 100px;
        }

        #datos{
        float: left;
        margin-top: 0%;
        margin-left: 2%;
        margin-right: 2%;
        /*text-align: justify;*/
        }

        #encabezado{
        text-align: center;
        margin-left: 10%;
        margin-right: 35%;
        font-size: 15px;
        }

        #fact{
        /*position: relative;*/
        float: right;
        margin-top: 2%;
        margin-left: 2%;
        margin-right: 2%;
        font-size: 20px;
        }

        section{
        clear: left;
        }

        #cliente{
        text-align: left;
        }

        #facliente{
        width: 40%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 15px;
        }

        #fac, #fv, #fa, #fi{
        color: #FFFFFF;
        font-size: 15px;
        }

        #facliente thead{
        padding: 20px;
        background: #2183E3;
        text-align: left;
        border-bottom: 1px solid #FFFFFF;  
        }

        #facvendedor, #facinfo{
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 15px;
        }

        #facvendedor thead{
        padding: 20px;
        background: #2183E3;
        text-align: center;
        border-bottom: 1px solid #FFFFFF;  
        }
        #facinfo thead{
        padding: 20px;
        background: #2183E3;
        text-align: center;
        border-bottom: 1px solid #FFFFFF;  
        }


        #facarticulo{
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 15px;
        }

        #facarticulo thead{
        padding: 20px;
        background: #2183E3;
        text-align: center;
        border-bottom: 1px solid #FFFFFF;  
        }

        #gracias{
        text-align: center; 
        }
    </style>
    <body>
        @foreach($venta as $v)
        <header>
            <div id="logo">
                <img src="img/logo.png" alt="asofrut" id="imagen">
            </div>
            <div id="datos">
                <p id="encabezado">
                    <b>Comcacaot SAS</b><br>Colombia, Nariño, Tumaco<br>
                </p>
            </div>
        </header>
        <br>
        <section>
            <div>
                <table id="facliente">
                    <thead>                        
                        <tr>
                            <th id="fac">Productor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th><p id="cliente">Sr(a). {{$v->nombre_persona}}<br>
                            Documento: {{$v->num_documento}}<br>
                            Dirección: {{$v->direccion}}<br>
                            Teléfono: {{$v->telefono}}<br>
                            Email: {{$v->email}}</p></th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <br>
        <section>
            <div>
                <table id="facvendedor">
                    <thead>
                        <tr id="fv">
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{$v->fechaVenta}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <section>
            <div>
                <table id="facinfo">
                    <thead>                        
                        <tr id="fi">
                            <th>Informacion Venta</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><b>Punto de Compra:</b> {{$v->nombre_lugarVenta}}<br>
                            <b>Zona:</b> {{$v->nombre_zona}}<br>
                            <b>Vereda:</b> {{$v->nombre_vereda}}<br>
                           </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        @endforeach
        <br>
        <section>
            <div>
                <table id="facarticulo">
                    <thead>
                        <tr id="fa">
                            <th>Tipo Cacao</th>
                            <th>Peso(Kg)</th>
                            <th>Humedad(%)</th>
                            <th>Fermentacion(%)</th>
                            <th>Descuento por humedad(Kg)</th>
                            <th>Valor Unitario</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($ventaCategoria as $ventaC)
                        <tr>
                            <td>{{$ventaC->nombre_categoria}}</td>
                            <td>{{$ventaC->peso}}</td>
                            <td>{{$ventaC->humedad}}</td>
                            <td>{{$ventaC->fermentacion}}</td>
                            <td>{{$ventaC->descuentoHumedadKg}}</td>
                            <td>{{$ventaC->valorUnitario}}</td>
                            <td>{{$ventaC->subtotal}}</td>
                        </tr>
                    @endforeach
                    </tbody>
                    <br>
                    <br>
                    <tfoot>                  
                    @foreach($venta as $v)
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <td></td>
                        </tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Peso Total(Kg)</th>
                            <td>{{$v->totalKilos}}</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Peso Total Neto(Kg) </th>
                            <td>{{$v->totalKilosNetos}}</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Total Incentivo($) </th>
                            <td>{{$v->totalIncentivoXkg}}</td>
                        </tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Total Neto($)</th>
                            <td>{{$v->totalNeto}}</td>
                        </tr>
                        @endforeach
                    </tfoot>
                </table>
            </div>
        </section>
    </body>
</html>