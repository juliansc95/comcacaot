<template>
            <main class="main">
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Escritorio</a></li>
            </ol>
            <div class="container-fluid">
                <!-- Ejemplo de tabla Listado -->
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i> Ventas
                        <button type="button" @click="mostrarDetalle()" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                      
                    </div>
                    <!-- Listado-->
                    <template v-if="listado==1">
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="personas">Nombre</option>
                                      <option value="fechaVenta">Fecha-Hora</option>
                                      <option value="totalKilos">Peso total</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarVenta(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarVenta(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>Opciones</th>
                                        <th>Productor</th>
                                        <th>Fecha</th>
                                        <th>Punto Compra</th>
                                        <th>Vereda</th>
                                        <th>Zona</th>
                                        <th>Peso Total(Kg)</th>
                                        <th>Total($)</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="venta in arrayVenta" :key="venta.id">
                                        <td>
                                            <button type="button" @click="verVenta(venta.id)" class="btn btn-success btn-sm">
                                            <i class="icon-eye"></i>
                                            </button> &nbsp;
                                            <template v-if="venta.estado_id=='1'">
                                                <button type="button" class="btn btn-danger btn-sm" @click="desactivarVenta(venta.id)">
                                                    <i class="icon-trash"></i>
                                                </button>
                                            </template>
                                        </td>
                                        <td v-text="venta.nombre_persona"></td>
                                        <td v-text="venta.fechaVenta"></td>
                                        <td v-text="venta.nombre_lugarVenta"></td>
                                        <td v-text="venta.nombre_vereda"></td>
                                        <td v-text="venta.nombre_zona"></td>
                                        <td v-text="venta.totalKilos"></td>
                                        <td v-text="venta.totalNeto"></td>
                                        <td v-text="venta.nombre_estadoVenta"></td>
                                    </tr>                                
                                </tbody>
                            </table>
                        </div>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item" v-if="pagination.current_page > 1">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1,buscar,criterio)">Ant</a>
                                </li>
                                <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page == isActived ? 'active' : '']">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(page,buscar,criterio)" v-text="page"></a>
                                </li>
                                <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1,buscar,criterio)">Sig</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    </template>
                    <!--Fin Listado-->
                    <!-- Detalle-->
                    <template v-else-if="listado==0">
                    <div class="card-body">
                        <div class="form-group row border">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Productor(*)</label>
                                    <v-select
                                        :on-search="selectProductor"
                                        label="nombre"
                                        :options="arrayProductor"
                                        placeholder="Buscar Productor..."
                                        :onChange="getDatosProductor"                                        
                                    >
                                    </v-select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Punto de compra(*)</label>
                                    <v-select
                                        :on-search="selectLugarVenta"
                                        label="nombre"
                                        :options="arrayLugarVenta"
                                        placeholder="Buscar punto de compra..."
                                        :onChange="getDatosLugarVenta"                                        
                                    >
                                    </v-select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Zona </label>
                                    <select class="form-control" v-model="zona_id" @click="selectVereda(zona_id)" @change="selectVereda(zona_id)">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="arrayZona in arrayZona" :key="arrayZona.id" :value="arrayZona.id" v-text="arrayZona.nombre" ></option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Vereda</label>
                                    <select class="form-control" v-model="vereda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="vereda in arrayVereda" :key="vereda.id" :value="vereda.id" v-text="vereda.nombre" ></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div v-show="errorVenta" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjVenta" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row border">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tipo Cacao <span style="color:red;" v-show="categoria_id==0">(*Seleccione)</span></label>
                                    <div class="form-inline">
                                        <input type="text" class="form-control" v-model="codigo" @keyup.enter="buscarCategoria()" placeholder="Ingrese tipo cacao">
                                        <button @click="abrirModal()" class="btn btn-primary">...</button>
                                        <input type="text" readonly class="form-control" v-model="categoria">
                                    </div>                                    
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Valor Unitario <span style="color:red;" v-show="valorUnitario==0"></span></label>
                                    <input type="number" value="0" step="any" class="form-control" disabled v-model="valorUnitario">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Peso(Kg) <span style="color:red;" v-show="peso==0">(*Ingrese)</span></label>
                                    <input type="number" value="0" step="any" class="form-control" v-model="peso">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <button @click="agregarDetalle()" class="btn btn-success form-control btnagregar"><i class="icon-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row border">
                            <div class="table-responsive col-md-12">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>Opciones</th>
                                            <th>Categoria</th>
                                            <th>Peso(Kg)</th>
                                            <th>% Humedad</th>
                                            <th>% Fermentacion</th>
                                            <th>Descuento por humedad(Kg)</th>
                                            <th>Valor Unitario</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="arrayDetalle.length">
                                        <tr v-for="(detalle,index) in arrayDetalle" :key="detalle.id">
                                            <td>
                                                <button @click="eliminarDetalle(index)" type="button" class="btn btn-danger btn-sm">
                                                    <i class="icon-close"></i>
                                                </button>
                                            </td>
                                            <td  v-text="detalle.categoria">
                                            </td>
                                            <td>
                                            <input v-model="detalle.peso" type="number" class="form-control">
                                            </td>
                                            <td>
                                            <input v-model="detalle.humedad" type="number" value="0" class="form-control">
                                            </td>
                                            <td>
                                            <input v-model="detalle.fermentacion"  type="number" value="0" class="form-control">
                                            </td>
                                            <td>
                                            {{(detalle.descuentoHumedadKg=detalle.peso*((detalle.humedad-8)/100)).toFixed(2)}}
                                            </td>
                                            <td v-text="detalle.valorUnitario">
                                            </td>
                                            <td>
                                                $ {{(detalle.subtotal=detalle.valorUnitario*(detalle.peso-detalle.descuentoHumedadKg)).toFixed(0)}}
                                            </td>    
                                        </tr>
                                         <tr style="background-color: #CEECF5;">
                                            <td colspan="7" align="right"><strong>Peso Total(Kg):</strong></td>
                                            <td> {{(totalKilos=calcularTotalKilos)}}</td>
                                        </tr>
                                        <tr style="background-color: #CEECF5;">
                                            <td colspan="7" align="right"><strong>Peso Total Neto(Kg):</strong></td>
                                            <td> {{(totalKilosNetos=calcularTotalDescuento.toFixed(2))}}</td>
                                        </tr>
                                         <tr style="background-color: #ff4d4d;">
                                            <td colspan="7" align="right"><strong>Incentivo por transporte y volumen por kg:</strong></td>
                                            <td>
                                                 <input v-model="totalIncentivoXkg"  type="number" class="form-control">
                                            </td>
                                        </tr>
                                         <tr style="background-color: #ff4d4d;">
                                            <td colspan="7" align="right"><strong>Total incentivo:</strong></td>
                                            <td>
                                                $ {{(totalIncentivo=totalKilosNetos*totalIncentivoXkg).toFixed(0)}}
                                            </td>
                                        </tr>
                                        <tr style="background-color: #CEECF5;">
                                            <td colspan="7" align="right"><strong>Total Neto:</strong></td>
                                            <td>$ {{(totalNeto=calcularTotal+totalIncentivo).toFixed(0)}}</td>
                                        </tr>
                                    </tbody>
                                    <tbody v-else>
                                        <tr>
                                            <td colspan="8">
                                                NO hay categorias agregadas
                                            </td>
                                        </tr>
                                    </tbody>                                    
                                </table>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Observaciones</label>
                            <textarea class="form-control" v-model="observaciones" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <button type="button" @click="ocultarDetalle()" class="btn btn-secondary">Cerrar</button>
                                <button type="button" class="btn btn-primary" @click="registrarVenta()">Registrar Venta</button>
                            </div>
                        </div>
                    </div>
                    </template>
                    <!-- Fin Detalle-->
                    <!-- Ver ingreso -->
                    <template v-else-if="listado==2">
                    <div class="card-body">
                        <div class="form-group row border">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Productor</label>
                                    <p v-text="productor"></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Punto de Compra</label>
                                    <p v-text="lugarVenta"></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Zona</label>
                                    <p v-text="zona"></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Vereda</label>
                                    <p v-text="vereda"></p>
                                </div>
                            </div>
                           
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Fecha</label>
                                    <p v-text="fechaVenta"></p>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row border">
                            <div class="table-responsive col-md-12">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>Tipo Cacao</th>
                                            <th>Peso(Kg)</th>
                                            <th>% Humedad</th>
                                            <th>% Fermentacion</th>
                                            <th>Descuento por humedad(Kg)</th>
                                            <th>Valor Unitario</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="arrayDetalle.length">
                                        <tr v-for="detalle in arrayDetalle" :key="detalle.id">
                                            <td v-text="detalle.nombre_categoria">
                                            </td>
                                            <td v-text="detalle.peso">
                                            </td>
                                            <td v-text="detalle.humedad">
                                            </td>
                                            <td v-text="detalle.fermentacion">
                                            </td>
                                            <td v-text="detalle.descuentoHumedadKg">
                                            </td>
                                            <td v-text="detalle.valorUnitario">
                                            </td>
                                            <td v-text="detalle.subtotal">
                                            </td>
                                        </tr>
                                       <tr style="background-color: #CEECF5;">
                                            <td colspan="6" align="right"><strong>Peso Total(Kg):</strong></td>
                                            <td v-text="totalKilos"></td>
                                        </tr>
                                        <tr style="background-color: #CEECF5;">
                                            <td colspan="6" align="right"><strong>Peso Total Neto(Kg):</strong></td>
                                            <td v-text="totalKilosNetos"></td>
                                        </tr>
                                         <tr style="background-color: #ff4d4d;">
                                            <td colspan="6" align="right"><strong>Incentivo por transporte y volumen por kg($):</strong></td>
                                            <td v-text="totalIncentivoXkg"></td>
                                        </tr>
                                         <tr style="background-color: #ff4d4d;">
                                            <td colspan="6" align="right"><strong>Total incentivo($):</strong></td>
                                            <td v-text="totalIncentivo"></td>
                                        </tr>
                                        <tr style="background-color: #CEECF5;">
                                            <td colspan="6" align="right"><strong>Total Neto($):</strong></td>
                                            <td v-text="totalNeto"></td>
                                        </tr>
                                    </tbody>
                                    <tbody v-else>
                                        <tr>
                                            <td colspan="4">
                                                NO hay categorias agregadas
                                            </td>
                                        </tr>
                                    </tbody>                                    
                                </table>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <button type="button" @click="ocultarDetalle()" class="btn btn-secondary">Cerrar</button>
                                
                            </div>
                        </div>
                    </div>
                    </template>
                    <!-- fin ver ingreso -->
                </div>
                <!-- Fin ejemplo de tabla Listado -->
            </div>
            <!--Inicio del modal agregar/actualizar-->
            <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-primary modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" v-text="tituloModal"></h4>
                            <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <select class="form-control col-md-3" v-model="criterioA">
                                        <option value="nombre">Nombre</option>
                                        <option value="valorUnitario">Valor Unitario</option>
                                        </select>
                                        <input type="text" v-model="buscarA" @keyup.enter="listarCategoria(buscarA,criterioA)" class="form-control" placeholder="Texto a buscar">
                                        <button type="submit" @click="listarCategoria(buscarA,criterioA)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>Opciones</th>
                                            <th>Nombre</th>
                                            <th>Valor Unitario</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="categoria in arrayCategoriaMoras" :key="categoria.id">
                                            <td>
                                                <button type="button" @click="agregarDetalleModal(categoria)" class="btn btn-success btn-sm">
                                                <i class="icon-check"></i>
                                                </button>
                                            </td>
                                            <td v-text="categoria.nombre"></td>
                                            <td v-text="categoria.valorUnitario"></td>
                                        </tr>                                
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        </div>
                    </div>
                   
                </div>   
               
            </div>
            <!--Fin del modal-->
        </main>
</template>

<script>
    import vSelect from 'vue-select';
    export default {
        data (){
            return {
                venta_id: 0,
                productor_id:0,
                productor:'',
                lugarVenta_id:0,
                lugarVenta:'',
                vereda_id:0,
                vereda:'',
                zona_id:0,
                zona:'',                
                totalKilos:0.0,
                totalKilosNetos:0.0,
                totalIncentivoXkg:0.0,
                totalIncentivo:0.0,
                totalNeto:0.0,
                observaciones:'',
                totalImpuesto: 0.0,
                totalParcial: 0.0,

                arrayVenta : [],
                arrayProductor: [],
                arrayLugarVenta: [],
                arrayVereda: [],
                arrayZona:[],
                arrayDetalle : [],
                listado:1,
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorVenta : 0,
                errorMostrarMsjVenta : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'personas',
                buscar : '',
                criterioA:'nombre',
                buscarA: 'Cacao',
                arrayCategoriaMoras: [],
                categoria_id: 0,
                categoria:'',
                codigo:0,
                peso:0,
                humedad:0.0,
                fermentacion:0.0,
                descuentoHumedadKg:0.0,
                valorUnitario: 0,
                totalSinDescuento:0,
                subtotal:0,
                estado:'',
                fechaVenta:'',
            }
        },
        components: {
            vSelect
        },
        computed:{
            isActived: function(){
                return this.pagination.current_page;
            },
            //Calcula los elementos de la paginación
            pagesNumber: function() {
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;
            },
            calcularTotal: function(){
                var resultado=0.0;
                for(var i=0;i<this.arrayDetalle.length;i++){
                    resultado=resultado+(this.arrayDetalle[i].subtotal)
                }
                               
                return resultado;
            },
             calcularTotalKilos: function(){
                var resultado=0.0;
                for(var i=0;i<this.arrayDetalle.length;i++){
                    resultado =Number(resultado)+Number(this.arrayDetalle[i].peso)
                }
                               
                return resultado;
                
            },
             calcularTotalDescuento: function(){
                var resultado=0.0;
                for(var i=0;i<this.arrayDetalle.length;i++){
                    resultado =Number(resultado)+Number(this.arrayDetalle[i].peso)-Number(this.arrayDetalle[i].peso)*Number((this.arrayDetalle[i].humedad-8)/100)
                }               
                return resultado;
            },
            calcularTotalDonacion: function(){
                var resultado=0.0;
                 for(var i=0;i<this.arrayDetalle.length;i++){
                resultado =Number(resultado)+(Number(this.arrayCategoriaMoras[0].ValorDonacion)*Number(this.arrayDetalle[i].peso));                              
                 }
                return resultado;               
            },
            calcularTotalTransporte: function(){
                var resultado=0.0;
                 for(var i=0;i<this.arrayDetalle.length;i++){
                resultado =Number(resultado)+(Number(this.arrayCategoriaMoras[0].valorTransporte)*Number(this.arrayDetalle[i].peso));                              
                 }
                return resultado;               
            },
            calcularTotalAsohof: function(){
                var resultado=0.0;
                 for(var i=0;i<this.arrayDetalle.length;i++){
                resultado =Number(resultado)+(Number(this.arrayDetalle[i].valorUnitario)*Number(this.arrayDetalle[i].peso)*Number(this.arrayCategoriaMoras[0].valorAsohof));                              
                 }
                return resultado;               
            },
            calcularTotalCuatroXmil: function(){
                var resultado=0.0;
                 for(var i=0;i<this.arrayDetalle.length;i++){
                resultado =Number(resultado)+(Number(this.arrayDetalle[i].valorUnitario)*Number(this.arrayDetalle[i].peso)*Number(this.arrayCategoriaMoras[0].valorCuatroPorMil));                              
                 }
                return resultado;               
            },
           
        },
        methods : {
            listarVenta (page,buscar,criterio){
                let me=this;
                var url= 'venta?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayVenta = respuesta.ventas.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectProductor(search,loading){
                let me=this;
                loading(true)

                var url= 'productor/selectProductor2?filtro='+search;
                axios.get(url).then(function (response) {
                    let respuesta = response.data;
                    q: search
                    me.arrayProductor=respuesta.personas;
                    loading(false)
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getDatosProductor(val1){
                let me = this;
                me.loading = true;
                me.productor_id = val1.id;
            },
            selectZona(){
                let me =this;
                var url ='zona/selectZona';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayZona= respuesta.zonas;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
           selectVereda(id){
                let me =this;
                var url ='vereda/selectVeredaZona/'+id;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayVereda= respuesta.veredas;
                })
                .catch(function (error) {
                    console.log(error);
                })
            },
            getDatosVereda(val1){
                let me = this;
                me.loading = true;
                me.vereda_id = val1.id;
            },
            selectLugarVenta(search,loading){
                let me=this;
                loading(true)

                var url= 'lugarVenta/selectLugarVenta2?filtro='+search;
                axios.get(url).then(function (response) {
                    let respuesta = response.data;
                    q: search
                    me.arrayLugarVenta=respuesta.lugarVentas;
                    loading(false)
                })
                .catch(function (error) {
                    console.log(error);
                });
            },

            getDatosLugarVenta(val1){
                let me = this;
                me.loading = true;
                me.lugarVenta_id = val1.id;
            },
            buscarCategoria(){
                let me=this;
                var url= 'categoriaMora/buscarCategoria?filtro=' + me.codigo;

                axios.get(url).then(function (response) {
                   var respuesta= response.data;
                    me.arrayCategoriaMoras = respuesta.categoriaMoras;
                   
                    if (me.arrayCategoriaMoras.length>0){
                        me.categoria=me.arrayCategoriaMoras[0]['nombre'];
                        me.categoria_id=me.arrayCategoriaMoras[0]['id'];
                        me.valorUnitario=me.arrayCategoriaMoras[0]['valorUnitario'];
                        me.ValorDonacion=me.arrayCategoriaMoras[0]['ValorDonacion'];
                        me.valorTransporte=me.arrayCategoriaMoras[0]['valorTransporte'];
                        me.valorAsohof=me.arrayCategoriaMoras[0]['valorAsohof'];
                        me.valorCuatroPorMil=me.arrayCategoriaMoras[0]['valorCuatroPorMil'];
                    }
                    else{
                        me.categoria='No existe categoria';
                        me.categoria_id=0;
                        me.valorUnitario=0;
                        me.ValorDonacion=0;
                        me.valorTransporte=0;
                        me.valorAsohof=0;
                        me.valorCuatroPorMil=0;
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            pdfVenta(id){
                window.open('http://localhost/comcacaot/public/venta/pdf/'+id);
            },
            cargarPdf(){
                window.open('http://gestion.asofrut.org/venta/listarPdf');
            },
            reporteDiario(){
                window.open('http://gestion.asofrut.org/venta/listarDiario');
            },
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarVenta(page,buscar,criterio);
            },
            encuentra(id){
                var sw=0;
                for(var i=0;i<this.arrayDetalle.length;i++){
                    if(this.arrayDetalle[i].categoria_id==id){
                        sw=true;
                    }
                }
                return sw;
            },
            eliminarDetalle(index){
                let me = this;
                me.arrayDetalle.splice(index, 1);
            },
            agregarDetalle(){
                let me=this;
                if(me.categoria_id==0){
                }
                else{
                    if(me.encuentra(me.categoria_id)){
                        swal.fire({
                            type: 'error',
                            title: 'Error...',
                            text: 'Esta categoria ya se encuentra agregada!',
                            })
                    }
                    else{
                      
                       me.arrayDetalle.push({
                            categoria_id: me.categoria_id,
                            categoria: me.categoria,
                            peso: me.peso,
                            valorUnitario:me.valorUnitario,
                            subtotal:me.subtotal,
                           
                            });
                        me.codigo="";
                        me.categoria_id=0;
                        me.categoria="";
                        me.peso=0;
                        me.humedad=0;
                        me.descuentoHumedadKg=0;
                        me.valorUnitario=0;
                        me.subtotal=0;
                        
                    }
                    
                }

                

            },
            agregarDetalleModal(data =[]){
                let me=this;
                if(me.encuentra(data['id'])){
                        swal.fire({
                            type: 'error',
                            title: 'Error...',
                            text: 'Esta categoria ya se encuentra agregada!',
                            })
                    }
                    else{
                       me.arrayDetalle.push({
                            categoria_id: data['id'],
                            categoria: data['nombre'],
                            valorUnitario:data['valorUnitario'],
                            subtotal:data['subtotal'],
                            peso: 1,
                            humedad:0,
                            descuentoHumedadKg:0
                       }); 
                    }
            },
            listarCategoria (buscar,criterio){
                let me=this;
                var url= 'categoriaMora/listarCategoria?buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayCategoriaMoras = respuesta.categoriaMoras.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            registrarVenta(){
                if (this.validarVenta()){
                    return;
                }
                
                let me = this;
                axios.post('venta/registrar',{
                    'productor_id': this.productor_id,
                    'lugarVenta_id' : this.lugarVenta_id,
                    'vereda_id':this.vereda_id,  
                    'zona_id': this.zona_id,                  
                    'totalKilos' : this.totalKilos,
                    'totalKilosNetos':this.totalKilosNetos,
                    'totalIncentivoXkg':this.totalIncentivoXkg,
                    'totalIncentivo':this.totalIncentivo,
                    'totalNeto':this.totalNeto,
                    'observaciones':this.observaciones,
                    'data': this.arrayDetalle

                }).then(function (response) {
                    me.listado=1;
                    me.listarVenta(1,'','personas');
                    me.productor_id=0;
                    me.lugarVenta_id=0;
                    me.vereda_id=0;
                    me.zona_id=0;
                    me.fechaVenta=0;
                    me.totalKilos=0;
                    me.totalKilosNetos=0;
                    me.totalIncentivoXkg=0;
                    me.totalNeto=0;
                    me.observaciones='';

                    me.categoria_id=0;
                    me.categoria='';
                    me.peso=0;
                    me.humedad=0;
                    me.fermentacion=0;
                    me.descuentoHumedadKg=0;
                    me.valorUnitario=0;
                    me.subtotal=0;
                    me.codigo='';
                    me.arrayDetalle=[];
                    window.open('http://comcacaot.com/venta/pdf/'+response.data.id);
                    window.open('http://comcacaot.com/venta/ticket/'+response.data.id);

                }).catch(function (error) {
                    console.log(error);
                });
            },
            validarVenta(){
                this.errorVenta=0;
                this.errorMostrarMsjVenta =[];

                if (this.productor_id==0) this.errorMostrarMsjVenta.push("Seleccione un Productor");
                if (this.lugarVenta_id==0) this.errorMostrarMsjVenta.push("Seleccione un punto de compra");
                if (this.arrayDetalle.length<=0) this.errorMostrarMsjVenta.push("Ingrese tipo de cacao");

                if (this.errorMostrarMsjVenta.length) this.errorVenta = 1;

                return this.errorVenta;
            },
            mostrarDetalle(){
                let me=this;
                me.listado=0;

                me.idproveedor=0;
                me.tipo_comprobante='BOLETA';
                me.serie_comprobante='';
                me.num_comprobante='';
                me.impuesto=0.18;
                me.total=0.0;
                me.idarticulo=0;
                me.articulo='';
                me.cantidad=0;
                me.precio=0;
                me.arrayDetalle=[];
                this.selectZona();
                this.selectVereda(this.zona_id);
            },
            ocultarDetalle(){
                this.listado=1;
                this.selectZona();
                this.selectVereda(this.zona_id);
            },
            verVenta(id){
                let me=this;
                me.listado=2;
                
                //Obtener los datos del ingreso
                var arrayVentaT=[];
                var url= 'venta/obtenerCabecera?id=' + id;
                
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    arrayVentaT = respuesta.venta;

                    me.productor = arrayVentaT[0]['nombre_persona'];
                    me.lugarVenta=arrayVentaT[0]['nombre_lugarVenta'];
                    me.vereda=arrayVentaT[0]['nombre_vereda'];
                    me.zona=arrayVentaT[0]['nombre_zona'];
                    me.fechaVenta=arrayVentaT[0]['fechaVenta'];
                    me.totalKilos=arrayVentaT[0]['totalKilos'];
                    me.totalKilosNetos=arrayVentaT[0]['totalKilosNetos'];
                    me.totalIncentivoXkg=arrayVentaT[0]['totalIncentivoXkg'];
                    me.totalIncentivo=arrayVentaT[0]['totalIncentivo'];
                    me.totalNeto=arrayVentaT[0]['totalNeto'];
                    me.estado=arrayVentaT[0]['nombre_estadoVenta'];
                    
                })
                .catch(function (error) {
                    console.log(error);
                });

                //Obtener los datos de los detalles 
                var urld= 'venta/obtenerDetalles?id=' + id;
                
                axios.get(urld).then(function (response) {
                    var respuesta= response.data;
                    me.arrayDetalle = respuesta.ventaCategoria;
                })
                .catch(function (error) {
                    console.log(error);
                });               
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
            }, 
            abrirModal(){               
                this.arrayCategoriaMoras=[];
                this.modal = 1;
                this.tituloModal = 'Seleccione uno o varios tipos';
            },
            desactivarVenta(id){
               swal.fire({
                title: 'Para anular esta venta por favor comunicarse con el supervisor o administrador del sistema',
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                })
            },
             pasarFacturacion(id){
               swal.fire({
                title: 'Esta seguro de pasar al estado de Tramite de Facturacion?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('venta/pasarFacturacion',{
                        'id': id
                    }).then(function (response) {
                        me.listarVenta(1,'','personas');
                        swal.fire(
                        'Tramite Facturacion!',
                        'La venta ha pasado al siguiente estado con exito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
              pasarDisponiblePago(id){
               swal.fire({
                title: 'Esta seguro de pasar al estado de Disponible para pago?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('venta/pasarDisponiblePago',{
                        'id': id
                    }).then(function (response) {
                        me.listarVenta(1,'','personas');
                        swal.fire(
                        'Disponible para pago!',
                        'La venta ha pasado al siguiente estado con exito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
               pasarPagado(id){
               swal.fire({
                title: 'Esta seguro de pasar al estado de pagado?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('venta/pasarPagado',{
                        'id': id
                    }).then(function (response) {
                        me.listarVenta(1,'','personas');
                        swal.fire(
                        'Pagado!',
                        'La venta ha pasado al siguiente estado con exito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
        },
        mounted() {
            this.listarVenta(1,this.buscar,this.criterio);
        }
    }
</script>
<style>    
    .modal-content{
        width: 100% !important;
        position: absolute !important;
    }
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        position: absolute !important;
        background-color: #3c29297a !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: red !important;
        font-weight: bold;
    }
    @media (min-width: 600px) {
        .btnagregar {
            margin-top: 2rem;
        }
    }
    .modal-dialog{
    overflow-y: initial !important
    }
    .modal-body{
    height: 250px;
    overflow-y: auto;
    }

</style>
