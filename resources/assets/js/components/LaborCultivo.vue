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
                        <i class="fa fa-align-justify"></i> Labores del cultivo
                        <button type="button" @click="abrirModal('cultivo','registrar')" class="btn btn-secondary">
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
                                    <input type="text" v-model="buscar" @keyup.enter="listarLabor(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarLabor(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
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
                                    <th>Tipo de poda</th>
                                    <th>Estado cultivo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="cultivo in arrayLabor" :key="cultivo.id">
                                    <td>
                                        <button type="button" @click="abrirModal('cultivo','actualizar',cultivo)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                    </td>
                                    <td v-text="cultivo.nombre_persona"></td>
                                    <td v-text="cultivo.nombre_finca"></td> 
                                    <td v-text="cultivo.nombre_poda"></td>     
                                    <td v-text="cultivo.nombre_estado"></td>                                     
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
                                    <label class="col-md-3 form-control-label" for="text-input">Control de malezas</label>
                                    <div class="col-md-9">
                                       <select class="form-control" v-model="control">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Metodo</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="metodo">
                                          <option value="Seleccione" disabled>Seleccione</option>
                                          <option value="Manual">Manual</option>
                                          <option value="Quimico">Quimico</option>
                                          <option value="Ambos">Ambos</option>                                          
                                      </select>  
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Observacion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="observacionMetodo" class="form-control" placeholder="">
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Realiza poda?</label>
                                    <div class="col-md-9">
                                       <select class="form-control" v-model="poda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="poda in arrayPoda" :key="poda.id" :value="poda.id" v-text="poda.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Observacion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="observacionPoda"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Drenajes</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="drenaje">
                                          <option value="Seleccione" disabled>Seleccione</option>
                                          <option value="Primario">Primario</option>
                                          <option value="Secundario">Secundario</option>
                                          <option value="Ambos">Ambos</option>       
                                          <option value="Ninguno">Ninguno</option>                                      
                                      </select>  
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Estado Actual</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="estado_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="estado in arrayEstado" :key="estado.id" :value="estado.id" v-text="estado.nombre" ></option>
                                        </select>
                                    </div>
                                </div> 
                                <label class="col-md-3 form-control-label" for="text-input">Nutricion</label>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Ha realizado fertilizacion?</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="fertilizacion">
                                          <option value="Seleccione" disabled>Seleccione</option>                                    
                                          <option value="Organica">Organica</option>
                                          <option value="Quimica">Quimica</option>
                                          <option value="No">No</option>                                                
                                      </select>  
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Hace cuanto?(Meses)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="fertilizacionTiempo"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Fuente de financiacion</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="financiacion_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="financiacion in arrayFinanciacion" :key="financiacion.id" :value="financiacion.id" v-text="financiacion.nombre" ></option>
                                        </select>
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Frecuencia de fertilizacion(Años)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="frecuenciaFertilizacion"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <label class="col-md-3 form-control-label" for="text-input">Enfermedades</label>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Realiza control?</label>
                                    <div class="col-md-9">
                                       <select class="form-control" v-model="controlEnfermedades">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tipo de Control</label>
                                    <div class="col-md-9">
                                       <select class="form-control" v-model="tipoControlEnfermedad">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="control in arrayControl" :key="control.id" :value="control.id" v-text="control.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Observacion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="observacionEnfermedad"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <label class="col-md-3 form-control-label" for="text-input">Plagas</label>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Realiza control?</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="controlPlagas">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>  
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tipo de Control</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="tipoControlPlagas">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="control in arrayControl" :key="control.id" :value="control.id" v-text="control.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Observacion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="observacionPlaga"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div v-show="errorCultivo" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjCultivo" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarLabor()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarLabor()">Actualizar</button>
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
                labor_id:0,
                productor_id:0,
                finca_id:0,
                control:0,
                metodo :'Seleccione',
                observacionMetodo :'',
                poda_id :0,
                observacionPoda :'',
                drenaje :'Seleccione',
                estado_id:0,
                fertilizacion:'',
                fertilizacionTiempo :0,
                financiacion_id :0,
                frecuenciaFertilizacion :0,
                controlEnfermedades :0,
                tipoControlEnfermedad:0,
                observacionEnfermedad:'',
                controlPlagas :0,
                tipoControlPlagas:0,
                observacionPlaga:'',
                arrayLabor: [],
                modal: 0,
                tituloModal : '',
                tipoAccion:0,
                errorCultivo : 0,
                errorMostrarMsjCultivo:[],
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
                arrayPoda: [],
                arrayEstado: [],
                arrayFinanciacion:[],
                arrayControl:[],
                arrayOpcion:[]           
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
            listarLabor(page,buscar,criterio){
                let me =this;
                var url ='laborcultivo?page='+page + '&buscar='+buscar+'&criterio='+criterio;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayLabor= respuesta.labor.data;
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
             selectPoda(){
                let me =this;
                var url ='tiposPoda/selecttiposPoda';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayPoda= respuesta.tiposPoda;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             selectEstadoCultivo(){
                let me =this;
                var url ='estadoCultivo/selectEstadoCultivo';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEstado= respuesta.estadoCultivo;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectFinanciacion(){
                let me =this;
                var url ='financiacion/selectFinanciacion';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayFinanciacion= respuesta.financiacion;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectTipoControl(){
                let me =this;
                var url ='tipocontrol/selectTipoControl';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayControl= respuesta.tipocontrol;
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
                me.listarLabor(page,buscar,criterio);
            },
            registrarLabor(){
            if(this.validarLabor()){
                return;
            }
            let me=this;
            axios.post('laborcultivo/registrar',{
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'control':this.control,
                'metodo':this.metodo,
                'observacionMetodo':this.observacionMetodo,
                'poda_id':this.poda_id,
                'observacionPoda':this.observacionPoda,
                'drenaje':this.drenaje,
                'estado_id':this.estado_id,
                'fertilizacion':this.fertilizacion,
                'fertilizacionTiempo':this.fertilizacionTiempo,
                'financiacion_id':this.financiacion_id,
                'frecuenciaFertilizacion':this.frecuenciaFertilizacion,
                'controlEnfermedades':this.controlEnfermedades,
                'tipoControlEnfermedad':this.tipoControlEnfermedad,
                'observacionEnfermedad':this.observacionEnfermedad,
                'controlPlagas':this.controlPlagas,
                'tipoControlPlagas':this.tipoControlPlagas,
                'observacionPlaga':this.observacionPlaga
            }).then(function (response) {
                    me.cerrarModal();
                    me.listarLabor(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
            actualizarLabor(){
            if(this.validarLabor()){
                return;
            }
            let me=this;
            console.log(me);
            axios.put('laborcultivo/actualizar',{
                'id':this.labor_id,
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'control':this.control,
                'metodo':this.metodo,
                'observacionMetodo':this.observacionMetodo,
                'poda_id':this.poda_id,
                'observacionPoda':this.observacionPoda,
                'drenaje':this.drenaje,
                'estado_id':this.estado_id,
                'fertilizacion':this.fertilizacion,
                'fertilizacionTiempo':this.fertilizacionTiempo,
                'financiacion_id':this.financiacion_id,
                'frecuenciaFertilizacion':this.frecuenciaFertilizacion,
                'controlEnfermedades':this.controlEnfermedades,
                'tipoControlEnfermedad':this.tipoControlEnfermedad,
                'observacionEnfermedad':this.observacionEnfermedad,
                'controlPlagas':this.controlPlagas,
                'tipoControlPlagas':this.tipoControlPlagas,
                'observacionPlaga':this.observacionPlaga
            }).then(function (response) {
                    console.log(response);
                    me.cerrarModal();
                    me.listarLabor(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
        },          
            validarLabor(){
            this.errorCultivo=0;
            this.errorMostrarMsjCultivo=[];

            
            if(this.productor_id==0)this.errorMostrarMsjCultivo.push("Debe seleccionar un productor.");
            if(this.finca_id==0)this.errorMostrarMsjCultivo.push("Debe seleccionar una finca.");
            if(this.errorMostrarMsjCultivo.length) this.errorCultivo=1;

            return this.errorCultivo;
        },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.productor_id=0;
                this.finca_id=0;
                this.control=0;
                this.metodo='Seleccione';
                this.observacionMetodo='';
                this.poda_id=0;
                this.observacionPoda='';
                this.drenaje='Seleccione';
                this.estado_id=0;
                this.fertilizacion='Seleccione';
                this.fertilizacionTiempo=0;
                this.financiacion_id=0;
                this.frecuenciaFertilizacion=0;
                this.controlEnfermedades=0;
                this.tipoControlEnfermedad=0;
                this.observacionEnfermedad='';
                this.controlPlagas=0;
                this.tipoControlPlagas=0;
                this.observacionPlaga='';
		        this.errorCultivo=0;
        },
            abrirModal(modelo,accion,data = []){
            switch (modelo) {
                case "cultivo":
                {    
                switch (accion) {
                    case 'registrar':
                    {
                        this.modal = 1;
                        this.tituloModal = 'Registrar labores del cultivo ';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.control=0;
                        this.metodo='Seleccione';
                        this.observacionMetodo='';
                        this.poda_id=0;
                        this.observacionPoda='';
                        this.drenaje='Seleccione';
                        this.estado_id=0;
                        this.fertilizacion='Seleccione';
                        this.fertilizacionTiempo=0;
                        this.financiacion_id=0;
                        this.frecuenciaFertilizacion=0;
                        this.controlEnfermedades=0;
                        this.tipoControlEnfermedad=0;
                        this.observacionEnfermedad='';
                        this.controlPlagas=0;
                        this.tipoControlPlagas=0;
                        this.observacionPlaga='';
                        this.tipoAccion=1;
                        break;
                    }    
                    case 'actualizar':
                    {
                        this.modal=1;
                        this.tituloModal='Actualizar labores del cultivo';
                        this.tipoAccion=2;
                        this.labor_id=data['id'];
                        this.productor_id=data['productor_id'];
                        this.finca_id=data['finca_id'];
                        this.control=data['control'];
                        this.metodo=data['metodo'];
                        this.observacionMetodo=data['observacionMetodo'];
                        this.poda_id=data['poda_id'];
                        this.observacionPoda=data['observacionPoda'];
                        this.drenaje=data['drenaje'];
                        this.estado_id=data['estado_id'];
                        this.fertilizacion=data['fertilizacion'];
                        this.fertilizacionTiempo=data['fertilizacionTiempo'];
                        this.financiacion_id=data['financiacion_id'];
                        this.frecuenciaFertilizacion=data['frecuenciaFertilizacion'];
                        this.controlEnfermedades=data['controlEnfermedades'];
                        this.tipoControlEnfermedad=data['tipoControlEnfermedad'];
                        this.observacionEnfermedad=data['observacionEnfermedad'];
                        this.controlPlagas=data['controlPlagas'];
                        this.tipoControlPlagas=data['tipoControlPlagas'];
                        this.observacionPlaga=data['observacionPlaga'];
                        break;
                    }       
                }
                }
            }
            this.selectProductor();
            this.selectFinca(this.productor_id);
            this.selectOpcion();
            this.selectPoda();
            this.selectEstadoCultivo();
            this.selectFinanciacion();
            this.selectTipoControl();    
        }
        },        
        mounted() {
           this.listarLabor(1,this.buscar,this.criterio);
           
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