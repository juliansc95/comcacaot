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
                        <i class="fa fa-align-justify"></i> Visita Linea Base
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
                                    <input type="text" v-model="buscar" @keyup.enter="listarProductor(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarProductor(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>Opciones</th>
                                        <th>Productor</th>
                                        <th>Tipo documento</th>
                                        <th>Numero documento</th>
                                        <th>Fecha Nacimiento</th>
                                        <th>Sexo</th>
                                        <th>Grado escolaridad</th>
                                        <th>Telefono</th>
                                        <th>Correo electronico</th>
                                        <th>Vereda</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="productor in arrayProductor" :key="productor.id">
                                        <td>
                                            <button type="button" @click="verVenta(productor.id)" class="btn btn-success btn-sm">
                                            <i class="icon-eye"></i>
                                            </button> &nbsp;
                                        </td>
                                        <td v-text="productor.nombre"></td>
                                        <td></td>
                                        <td v-text="productor.num_documento"></td>
                                        <td v-text="productor.fechaNacimiento"></td>
                                        <td v-text="productor.nombre_sexo"></td>
                                        <td v-text="productor.nombre_escolaridad"></td>
                                        <td v-text="productor.telefono"></td>
                                        <td v-text="productor.email"></td>
                                        <td v-text="productor.nombre_vereda"></td>
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
                        <div class="form-group row">
                             <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Productor</label>
                                      <select class="form-control" v-model="productor_id" @click="selectFinca(productor_id)" @change="selectFinca(productor_id)">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="productor in arrayProductor2" :key="productor.id" :value="productor.id" v-text="productor.nombre" ></option>
                                      </select>  
                                </div>
                                </div>
                            <div class="col-md-3">
                                 <div class="form-group">
                                    <label for="">Finca</label>
                                      <select class="form-control" v-model="finca_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="finca in arrayFinca" :key="finca.id" :value="finca.id" v-text="finca.nombre" ></option>
                                      </select>  
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Area Produccion(Hectareas)</label>
                                      <input type="number" v-model="areaProduccion"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Siembra Nueva(Hectareas)</label>
                                       <input type="number" v-model="siembra"  class="form-control" placeholder="">
                                </div>
                            </div>
                        </div>
                          <div class="form-group row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Edad del cultivo</label>
                                       <input type="number" v-model="edad"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Numero de arboles sembrados</label>
                                       <input type="number" v-model="numeroArboles"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Produccion Mensual(Kg)</label>
                                       <input type="number" v-model="produccion"  class="form-control" placeholder="">
                                </div>
                            </div>                          
                        <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">A quien vende(*)</label>
                                    <v-select
                                        :on-search="selectLugarVenta"
                                        label="nombre"
                                        :options="arrayLugarVenta"
                                        placeholder="Buscar..."
                                        :onChange="getDatosLugarVenta"                                        
                                    >
                                    </v-select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Vendido Fresco(Kg)</label>
                                       <input type="number" v-model="vendidoFresco"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Por vender Fresco(Kg)</label>
                                       <input type="number" v-model="porVenderFresco"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Vendido Seco(Kg)</label>
                                       <input type="number" v-model="vendidoSeco"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Por vender Seco(Kg)</label>
                                       <input type="number" v-model="porVenderSeco"  class="form-control" placeholder="">
                                </div>
                            </div>                          
                        </div>

                         <div class="form-group">
                            <div class="table-responsive col-md-12">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Compromiso</th>
                                            <th>Porcentaje Ejecucion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="text" v-model="NombreP1"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP1"  class="form-control" placeholder="">
                                            </td>   
                                        </tr>
                                    </tbody>  
                                     <tbody>
                                        <tr>
                                            <td>2</td>
                                            <td>
                                                <input type="text" v-model="NombreP2"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP2"  class="form-control" placeholder="">
                                            </td>
                                        </tr>
                                    </tbody> 
                                    <tbody>
                                        <tr>
                                            <td>3</td>
                                            <td>
                                                <input type="text" v-model="NombreP3"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP3"  class="form-control" placeholder="">
                                            </td> 
                                        </tr>
                                    </tbody> 
                                    <tbody>
                                        <tr>
                                            <td>4</td>
                                            <td>
                                                <input type="text" v-model="NombreP4"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP4"  class="form-control" placeholder="">
                                            </td>
                                        </tr>
                                    </tbody>   
                                    <tbody>
                                        <tr>
                                            <td>5</td>
                                            <td>
                                                <input type="text" v-model="NombreP5"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP5"  class="form-control" placeholder="">
                                            </td>
                                        </tr>
                                    </tbody>                             
                                </table>
                            </div>
                        </div> 
                        <div class="form-group row">
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Objetivos</label>
                                       <input type="text" v-model="objetivos"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Estado actual finca</label>
                                       <input type="text" v-model="estadoFinca"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Recomendaciones tecnico ambientales</label>
                                       <input type="text" v-model="recomendaciones"  class="form-control" placeholder="">
                                </div>
                            </div>
                            </div>
                            <div class="form-group row">
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Observaciones</label>
                                       <input type="text" v-model="observaciones"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Nivel Satisfaccion Asistencia(%)</label>
                                       <input type="number" v-model="asistencia"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Nivel Satisfaccion Empresa(%)</label>
                                       <input type="number" v-model="empresa"  class="form-control" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <button type="button" @click="ocultarDetalle()" class="btn btn-secondary">Cerrar</button>
                                <button type="button" class="btn btn-primary" @click="registrarVisita()">Registrar</button>
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
                                    <label>Lugar de Venta</label>
                                    <p v-text="lugarVenta"></p>
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
                                            <td v-text="detalle.valorUnitario">
                                            </td>
                                            <td v-text="detalle.subtotal">
                                            </td>
                                        </tr>
                                       <tr style="background-color: #CEECF5;">
                                            <td colspan="3" align="right"><strong>Peso Total(Kg):</strong></td>
                                            <td v-text="totalKilos"></td>
                                        </tr>
                                         <tr style="background-color: #ff4d4d;">
                                            <td colspan="3" align="right"><strong>Descuento por humedad:</strong></td>
                                            <td></td>
                                        </tr>
                                        <tr style="background-color: #CEECF5;">
                                            <td colspan="3" align="right"><strong>Total Neto:</strong></td>
                                            <td v-text="totalVenta"></td>
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
    import Datepicker from 'vuejs-datepicker';
    export default {
        data (){
            return {
                persona_id:0, 
                productor_id:0,
                finca_id:0,
                areaProduccion:0,
                siembra:0,
                edad:0,
                numeroArboles:0,
                produccion:0,
                lugarVenta_id:0,
                vendidoFresco:0,
                porVenderFresco:0,
                vendidoSeco:0,
                porVenderSeco:0,
                objetivos:'',
                estadoFinca:'',
                recomendaciones:'',
                observaciones:'',
                asistencia:0,
                empresa:0,
                NombreP1:'',
                ccP1:0,
                NombreP2:'',
                ccP2:0,
                NombreP3:'',
                ccP3:0,
                NombreP4:'',
                ccP4:0,
                NombreP5:'',
                ccP5:0,

                arrayProductor : [],
                arrayProductor2 : [],
                arrayFinca : [],
                arrayLugarVenta: [],                
                arrayDetalle : [],
                listado:1,
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorProductor : 0,
                errorMostrarMsjProductor : [],
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
                valorUnitario: 0,
                ValorDonacion: 0,
                valorTransporte:0,
                valorAsohof:0,
                valorCuatroPorMil:0,
                totalSinDescuento:0,
                totalDonacion:0,
                totalTransporte:0,
                totalAsohof:0,
                totalCuatroXmil:0,
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
        },
        methods : {
            listarProductor (page,buscar,criterio){
                let me=this;
                var url= 'productor?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayProductor = respuesta.personas.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectProductor(){
                let me =this;
                var url ='productor/selectProductor';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayProductor2= respuesta.personas;
                    console.log(arrayProductor2);
                })
                .catch(function (error) {
                    console.log(error);
                })
            },
             selectFinca(id){
                let me =this;
                var url ='finca/selectFinca/'+id;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayFinca= respuesta.fincas;
                })
                .catch(function (error) {
                    console.log(error);
                })
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
            pdfVenta(id){
                window.open('http://gestion.asofrut.org/venta/pdf/'+id);
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
                me.listarProductor(page,buscar,criterio);
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
            registrarVisita(){
                if (this.validarVisita()){
                    return;
                }
                
                let me = this;
                axios.post('visita/registrar',{
                'productor_id':this.productor_id,   
                'finca_id':this.finca_id,
                'areaProduccion':this.areaProduccion,
                'siembra':this.siembra,
                'edad':this.edad,
                'numeroArboles':this.numeroArboles,
                'produccion':this.produccion,
                'lugarVenta_id':this.lugarVenta_id,
                'vendidoFresco':this.vendidoFresco,
                'porVenderFresco':this.porVenderFresco,
                'vendidoSeco':this.vendidoSeco,
                'porVenderSeco':this.porVenderSeco,
                'objetivos':this.objetivos,
                'estadoFinca':this.estadoFinca,
                'recomendaciones':this.recomendaciones,
                'observaciones':this.observaciones,
                'asistencia':this.asistencia,
                'empresa':this.empresa,
                'NombreP1':this.NombreP1,
                'ccP1':this.ccP1
                }).then(function (response) {
                    me.listado=1;
                    me.listarProductor(1,'','personas');
                    me.nombre='';
                    me.tipo_id=0;
                    me.num_documento=0;
                    me.telefono=0;
                    me.email='';   
                    me.estadoCivil_id=0;
                    me.etnia_id=0;
                    me.sexo_id=0;
                    me.fechaNacimiento='';
                    me.vereda_id=0;
                    me.vivienda_id=0;
                    me.tipovivienda_id=0;
                    me.escolaridad_id=0;
                    me.carnetSalud=0;
                    me.discapacitado=0;
                    me.personasAcargo=0;
                    me.desplazado=0;
                    me.asociacion_id=0;
                    me.programaEstado_id=0;
                    me.asistencia=0;
                    me.entidad='';
                    me.capacitacion=0;
                    me.temas='';
                    me.parentesco1='';
                    me.NombreP1='';
                    me.ccP1=0;
                    me.fechaNacimientoP1='';
                    me.escolaridad_idP1='';
                    me.parentesco2='';
                    me.NombreP2='';
                    me.ccP2=0;
                    me.fechaNacimientoP2='';
                    me.escolaridad_idP2='';
                    me.parentesco3='';
                    me.NombreP3='';
                    me.ccP3=0;
                    me.fechaNacimientoP3='';
                    me.escolaridad_idP3='';
                    me.parentesco4='';
                    me.NombreP4='';
                    me.ccP4=0;
                    me.fechaNacimientoP4='';
                    me.escolaridad_idP4='';
                    me.parentesco5='';
                    me.NombreP5='';
                    me.ccP5=0;
                    me.fechaNacimientoP5='';
                    me.escolaridad_idP5='';
                }).catch(function (error) {
                    console.log(error);
                });
            },
            validarVisita(){
                this.errorProductor=0;
                this.errorMostrarMsjProductor =[];

                if (this.productor_id==0) this.errorMostrarMsjProductor.push("Seleccione un Productor");
                if (this.finca_id==0) this.errorMostrarMsjProductor.push("Seleccione una finca");
                if (this.errorMostrarMsjProductor.length) this.errorProductor = 1;

                return this.errorProductor;
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
                this.selectProductor();
                this.selectFinca(this.productor_id);
            },
            ocultarDetalle(){
                this.listado=1;
            },
            verVenta(id){
                let me=this;
                me.listado=2;
                
                //Obtener los datos del ingreso
                var arrayProductorT=[];
                var url= 'venta/obtenerCabecera?id=' + id;
                
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    arrayProductorT = respuesta.venta;

                    me.productor = arrayProductorT[0]['nombre_persona'];
                    me.linea=arrayProductorT[0]['nombre_linea'];
                    me.lugarVenta=arrayProductorT[0]['nombre_lugarVenta'];
                    me.estado=arrayProductorT[0]['nombre_estadoVenta'];
                    me.totalVenta=arrayProductorT[0]['totalVenta'];
                    me.totalKilos=arrayProductorT[0]['totalKilos'];
                    me.fechaVenta=arrayProductorT[0]['fechaVenta'];
                    me.totalDonacion=arrayProductorT[0]['totalDonacion'];
                    me.totalTransporte=arrayProductorT[0]['totalTransporte'];
                    me.totalAsohof=arrayProductorT[0]['totalAsohof'];
                    me.totalCuatroXmil=arrayProductorT[0]['totalCuatroXmil'];

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
                title: 'Esta seguro de anular esta venta?',
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

                    axios.put('venta/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarProductor(1,'','personas');
                        swal.fire(
                        'Anulado!',
                        'La venta ha sido anulada con éxito.',
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
                        me.listarProductor(1,'','personas');
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
                        me.listarProductor(1,'','personas');
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
                        me.listarProductor(1,'','personas');
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
            this.listarProductor(1,this.buscar,this.criterio);
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
