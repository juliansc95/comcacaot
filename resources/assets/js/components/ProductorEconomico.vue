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
                        <i class="fa fa-align-justify"></i> Componente Economico Productor
                        <button type="button" @click="abrirModal('componente','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="nombre">Nombre</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarComponente(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarComponente(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class='table-responsive'>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Productor</th>
                                    <th>Finca</th>
                                    <th>Ingreso mensual</th>
                                    <th>Gasto mensual</th>
                                    <th>Otros ingresos</th>
                                    <th>Ingreso Neto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="componente in arrayEconomico" :key="componente.id">
                                    <td>
                                        <button type="button" @click="abrirModal('componente','actualizar',componente)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                    </td>
                                    <td v-text="componente.nombre_persona"></td>
                                    <td v-text="componente.nombre_finca"></td>  
                                    <td v-text="componente.ingresoMensual"></td>
                                    <td v-text="componente.gastoMensual"></td>
                                    <td v-text="componente.otrosIngresos"></td>
                                    <td v-text="componente.ingresoNeto"></td>                                      
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item" v-if="pagination.current_page > 1"> 
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1,buscar,criterio)">Ant</a>
                                </li>
                                <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page==isActived ? 'active' : '']">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(page,buscar,criterio)" v-text="page"></a>
                                </li>
                                <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1,buscar,criterio)">Sig</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Fin ejemplo de tabla Listado -->
            </div>
            <!--Inicio del modal agregar/actualizar-->
            <div class="modal fade" tabindex="-1" :class="{'mostrar':modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-primary modal-lg"  role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" v-text="tituloModal"></h4>
                            <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Productor</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="productor_id" @click="selectFinca(productor_id)" @change="selectFinca(productor_id)">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="productor in arrayProductor" :key="productor.id" :value="productor.id" v-text="productor.nombre" ></option>
                                      </select>  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Finca</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="finca_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="finca in arrayFinca" :key="finca.id" :value="finca.id" v-text="finca.nombre" ></option>
                                      </select>  
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Ingreso Mensual de la finca($)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="ingresoMensual"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Gasto Mensual($)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="gastoMensual"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Otros ingresos($)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="otrosIngresos"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Ingresos neto($)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="ingresoNeto" class="form-control" placeholder="">
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tiene credito</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="credito">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Entidad</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="banco_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="banco in arrayBanco" :key="banco.id" :value="banco.id" v-text="banco.nombre" ></option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Otro Entidad Credito</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="otro_credito"  class="form-control" placeholder="">
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tiene cuenta de ahorro</label>
                                    <div class="col-md-9">
                                     <select class="form-control" v-model="ahorro">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                    </select>   
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Entidad</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="ahorro_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="banco in arrayBanco" :key="banco.id" :value="banco.id" v-text="banco.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Otro Entidad Ahorros</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="otro_ahorro"  class="form-control" placeholder="">
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Maneja registros</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="registro">
                                          <option value="Seleccione" disabled>Seleccione</option>
                                          <option value="Ingresos">Ingresos</option>
                                          <option value="Gastos">Gastos</option>
                                          <option value="Ingresos y gastos">Ingresos y gastos</option> 
                                          <option value="No maneja">No maneja</option>        
                                      </select>  
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Es accionista de comcacaot</label>
                                    <div class="col-md-9">
                                        <select class="form-control" v-model="accionista">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>   
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Cuantas acciones tiene</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="numeroAcciones"  class="form-control" placeholder="">
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Esta interesado en la compra de acciones</label>
                                    <div class="col-md-9">
                                       <select class="form-control" v-model="interesadoCompra">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>   
                                    </div>
                                </div> 
                                <div v-show="errorEconomico" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjEconomico" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarComponente()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarComponente()">Actualizar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!--Fin del modal-->
        </main>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
    export default {
        data(){
            return{
                economico_id:0,
                productor_id:0,
                finca_id:0,
                ingresoMensual:0,
                gastoMensual :0,
                otrosIngresos :0,
                ingresoNeto :0,
                credito :0,
                otro_credito:'',
                banco_id :0,
                ahorro:0,
                ahorro_id:0,
                otro_ahorro:'',
                registro:'Seleccione',
                accionista :0,
                numeroAcciones:0,
                interesadoCompra:0,
                arrayEconomico: [],
                modal: 0,
                tituloModal : '',
                tipoAccion:0,
                errorEconomico : 0,
                errorMostrarMsjEconomico:[],
                pagination:{
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset:3,
                criterio: 'nombre',
                buscar: '',
                arrayProductor : [],
                arrayFinca : [],
                arrayOpcion: [],
                arrayBanco: []           
            }
        },
        computed:{
            isActived:function(){
                return this.pagination.current_page;
            },
            pagesNumber:function(){
                if(!this.pagination.to){
                    return [];
                }
                var from = this.pagination.current_page - this.offset;
                if(from < 1){
                    from=1;
                }
                var to = from + (this.offset * 2);
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }
                var pagesArray=[];
                while(from <= to){
                    pagesArray.push(from);
                    from ++;
                }
                return pagesArray;
            }

        },
        methods: {
            listarComponente(page,buscar,criterio){
                let me =this;
                var url ='economico?page='+page + '&buscar='+buscar+'&criterio='+criterio;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEconomico= respuesta.componentes.data;
                    me.pagination=respuesta.pagination;
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
                    me.arrayProductor= respuesta.personas;
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
           selectOpcion(){
                let me =this;
                var url ='opcion/selectOpcion';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayOpcion= respuesta.opciones;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectBanco(){
                let me =this;
                var url ='banco/selectBanco';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayBanco= respuesta.bancos;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },            
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza a la pagina actual
                me.pagination.current_page = page;
                //Envia la peticion para visualizar la data de esa pagina
                me.listarComponente(page,buscar,criterio);
            },
            registrarComponente(){
            if(this.validarComponente()){
                return;
            }
            let me=this;
            axios.post('economico/registrar',{
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'ingresoMensual':this.ingresoMensual,
                'gastoMensual':this.gastoMensual,
                'otrosIngresos':this.otrosIngresos,
                'ingresoNeto':this.ingresoNeto,
                'credito':this.credito,
                'banco_id':this.banco_id,
                'otro_credito':this.otro_credito,
                'ahorro':this.ahorro,
                'ahorro_id':this.ahorro_id,
                'otro_ahorro':this.otro_ahorro,
                'registro':this.registro,
                'accionista':this.accionista,
                'numeroAcciones':this.numeroAcciones,
                'interesadoCompra':this.interesadoCompra,
            }).then(function (response) {
                    me.cerrarModal();
                    me.listarComponente(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
            actualizarComponente(){
            if(this.validarComponente()){
                return;
            }
            let me=this;
            axios.put('economico/actualizar',{
                'id':this.economico_id,
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'ingresoMensual':this.ingresoMensual,
                'gastoMensual':this.gastoMensual,
                'otrosIngresos':this.otrosIngresos,
                'ingresoNeto':this.ingresoNeto,
                'credito':this.credito,
                'banco_id':this.banco_id,
                'otro_credito':this.otro_credito,
                'ahorro':this.ahorro,
                'ahorro_id':this.ahorro_id,
                'otro_ahorro':this.otro_ahorro,
                'registro':this.registro,
                'accionista':this.accionista,
                'numeroAcciones':this.numeroAcciones,
                'interesadoCompra':this.interesadoCompra,
                
            }).then(function (response) {
                    console.log(response);
                    me.cerrarModal();
                    me.listarComponente(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
        },          
            validarComponente(){
            this.errorEconomico=0;
            this.errorMostrarMsjEconomico=[];

            
            if(this.productor_id==0)this.errorMostrarMsjEconomico.push("Debe seleccionar un productor.");
            if(this.finca_id==0)this.errorMostrarMsjEconomico.push("Debe seleccionar una finca.");
            if(this.errorMostrarMsjEconomico.length) this.errorEconomico=1;

            return this.errorEconomico;
        },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.productor_id=0;
                this.finca_id=0;
                this.ingresoMensual=0;
                this.gastoMensual=0;
                this.otrosIngresos=0;
                this.ingresoNeto=0;
                this.credito=0;
                this.banco_id=0;
                this.otro_credito='';
                this.ahorro=0;
                this.ahorro_id=0;
                this.otro_ahorro='';
                this.registro='Seleccione';
                this.accionista=0;
                this.numeroAcciones=0;
                this.interesadoCompra=0;
                this.errorEconomico=0;
        },
            abrirModal(modelo,accion,data = []){
            switch (modelo) {
                case "componente":
                {    
                switch (accion) {
                    case 'registrar':
                    {
                        this.modal = 1;
                        this.tituloModal = 'Registrar componente economico productor ';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.ingresoMensual=0;
                        this.gastoMensual=0;
                        this.otrosIngresos=0;
                        this.ingresoNeto=0;
                        this.credito=0;
                        this.banco_id=0;
                        this.otro_credito='';
                        this.ahorro=0;
                        this.ahorro_id=0;
                        this.otro_ahorro='';
                        this.registro ='Seleccione';
                        this.accionista=0;
                        this.numeroAcciones=0;
                        this.interesadoCompra=0;
                        this.tipoAccion=1;
                        break;
                    }    
                    case 'actualizar':
                    {
                        this.modal=1;
                        this.tituloModal='Actualizar componente economico productor';
                        this.tipoAccion=2;
                        this.economico_id=data['id'];
                        this.productor_id=data['productor_id'];
                        this.finca_id=data['finca_id'];
                        this.ingresoMensual=data['ingresoMensual'];
                        this.gastoMensual=data['gastoMensual'];
                        this.otrosIngresos=data['otrosIngresos'];
                        this.ingresoNeto=data['ingresoNeto'];
                        this.credito=data['credito'];
                        this.banco_id=data['banco_id'];
                        this.otro_credito=data['otro_credito'];
                        this.ahorro=data['ahorro'];
                        this.ahorro_id=data['ahorro_id'];
                        this.otro_ahorro=data['otro_ahorro'];
                        this.registro=data['registro'];
                        this.accionista=data['accionista'];
                        this.numeroAcciones= data['numeroAcciones'];
                        this.interesadoCompra=data['interesadoCompra'];
                        break;
                    }       
                }
                }
            }
            this.selectProductor();
            this.selectFinca(this.productor_id);
            this.selectOpcion();
            this.selectBanco();    
        }
        },        
        mounted() {
           this.listarComponente(1,this.buscar,this.criterio);
           
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
        display:flex;
        justify-content: center;
    }
    .text-error{
        color:red !important;
        font-weight: bold;
    }
    .modal-dialog{
    overflow-y: initial !important
    }
    .modal-body{
    height: 250px;
    overflow-y: auto;
    }
</style>