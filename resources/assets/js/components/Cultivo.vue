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
                        <i class="fa fa-align-justify"></i> Area cultivo cacao
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
                                    <input type="text" v-model="buscar" @keyup.enter="listarCultivo(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarCultivo(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
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
                                    <th>Area Cultivo(m2)</th>
                                    <th>Edad Cultivo(Años)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="cultivo in arrayCultivo" :key="cultivo.id">
                                    <td>
                                        <button type="button" @click="abrirModal('cultivo','actualizar',cultivo)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                    </td>
                                    <td v-text="cultivo.nombre_persona"></td>
                                    <td v-text="cultivo.nombre_finca"></td>                                    
                                    <td v-text="cultivo.areaTotalCultivo"></td>
                                    <td v-text="cultivo.edadCultivo"></td>
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
                                    <label class="col-md-3 form-control-label" for="number-input">Numero Documento</label>
                                    <div class="col-md-9">
                                    <input type="text" class="form-control" v-for="cedula in arrayCedula" :key="cedula.num_documento" :value="cedula.num_documento" v-text="cedula.num_documento" disabled>  
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
                                    <label class="col-md-3 form-control-label" for="number-input">Area Total del cultivo(Hectareas)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="areaTotalCultivo"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Edad del cultivo</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="edadCultivo"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <label class="col-md-3 form-control-label" for="number-input">Arboles</label>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Criollo(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="criollo"  class="form-control" placeholder="">
                                    </div>
                                </div>                               
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">CCN-51(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="CCN51"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">ICS-95(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="ICS95"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Otros(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="otros" class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Injertado</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="injertado">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                    </div>
                                </div>
                                <label class="col-md-3 form-control-label" for="number-input">CON(VARIEDAD)</label>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Criollo(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="variedadCriollo"  class="form-control" placeholder="">
                                    </div>
                                </div>                               
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">CCN-51(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="variedadCCN51"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">ICS-95(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="variedadICS95"  class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">Otros(Cantidad)</label>
                                    <div class="col-md-9">
                                        <input type="number"  v-model="variedadotros" class="form-control" placeholder="">
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="number-input">No. arboles en produccion</label>
                                    <div class="col-md-9">
                                        <input type="number" v-model="arbolesProduccion" class="form-control" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Estado Plantacion</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="estado_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="estado in arrayEstado" :key="estado.id" :value="estado.id" v-text="estado.nombre" ></option>
                                        </select>  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">¿Por que?</label>
                                    <div class="col-md-9">
                                     <select class="form-control" v-model="mantenimiento_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="mantenimiento in arrayMantenimiento" :key="mantenimiento.id" :value="mantenimiento.id" v-text="mantenimiento.nombre" ></option>
                                     </select>  
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">¿Por que?</label>
                                    <div class="col-md-9">
                                      <multiselect class="form-control" v-model="mantenimiento_id"  placeholder="Seleccione uno o mas" label="nombre" track-by="id" :options="arrayMantenimiento" :multiple="true" :taggable="true">
                                      </multiselect>  
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
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarCultivo()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarCultivo()">Actualizar</button>
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
import Multiselect from 'vue-multiselect';
    export default {
        data(){
            return{
                cultivo_id:0,
                productor_id:0,
                finca_id:0,
                areaTotalCultivo:0,
                edadCultivo :0,
                criollo :0,
                CCN51 :0,
                ICS95 :0,
                otros :0,
                injertado:0,
                variedadCriollo:0,
                variedadCCN51 :0,
                variedadICS95 :0,
                variedadotros :0,
                arbolesProduccion:0,
                estado_id:0,
                mantenimiento_id:[],
                arrayCultivo: [],
                arrayPersonas: [],
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
                arrayOpcion: [],
                arrayEstado: [],
                arrayMantenimiento: []  
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
            listarCultivo(page,buscar,criterio){
                let me =this;
                var url ='areacultivo?page='+page + '&buscar='+buscar+'&criterio='+criterio;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayCultivo= respuesta.cultivos.data;
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

                var url2 ='productor/getCedula/'+id;    
                axios.get(url2).then(function (response) {
                    var respuesta = response.data;
                    me.arrayCedula= respuesta.persona;
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
            selectMantenimiento(){
                let me =this;
                var url ='mantenimiento/selectMantenimiento';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayMantenimiento= respuesta.mantenimiento;
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
                me.listarCultivo(page,buscar,criterio);
            },
            registrarCultivo(){
            if(this.validarCultivo()){
                return;
            }
            let me=this;
            axios.post('areacultivo/registrar',{
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'areaTotalCultivo':this.areaTotalCultivo,
                'edadCultivo':this.edadCultivo,
                'criollo':this.criollo,
                'CCN51':this.CCN51,
                'ICS95':this.ICS95,
                'otros':this.otros,
                'injertado':this.injertado,
                'variedadCriollo':this.variedadCriollo,
                'variedadCCN51':this.variedadCCN51,
                'variedadICS95':this.variedadICS95,
                'variedadotros':this.variedadotros,
                'arbolesProduccion':this.arbolesProduccion,
                'estado_id':this.estado_id,
                'mantenimiento_id':this.mantenimiento_id,
            }).then(function (response) {
                    me.cerrarModal();
                    me.listarCultivo(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
            actualizarCultivo(){
            if(this.validarCultivo()){
                return;
            }
            let me=this;
            console.log(me);
            axios.put('areacultivo/actualizar',{
                'id':this.cultivo_id,
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'areaTotalCultivo':this.areaTotalCultivo,
                'edadCultivo':this.edadCultivo,
                'criollo':this.criollo,
                'CCN51':this.CCN51,
                'ICS95':this.ICS95,
                'otros':this.otros,
                'injertado':this.injertado,
                'variedadCriollo':this.variedadCriollo,
                'variedadCCN51':this.variedadCCN51,
                'variedadICS95':this.variedadICS95,
                'variedadotros':this.variedadotros,
                'arbolesProduccion':this.arbolesProduccion,
                'estado_id':this.estado_id,
                'mantenimiento_id':this.mantenimiento_id,
                
            }).then(function (response) {
                    console.log(response);
                    me.cerrarModal();
                    me.listarCultivo(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
        },          
            validarCultivo(){
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
                this.areaTotalCultivo=0;
                this.edadCultivo=0;
                this.criollo=0;
                this.CCN51=0;
                this.ICS95=0;
                this.otros=0;
                this.injertado=0;
                this.variedadCriollo=0;
                this.variedadCCN51=0;
                this.variedadICS95=0;
                this.variedadotros=0;
                this.arbolesProduccion=0;
                this.estado_id=0;
                this.mantenimiento_id=[];
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
                        this.tituloModal = 'Registrar area cultivo cacao';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.areaTotalCultivo=0;
                        this.edadCultivo=0;
                        this.criollo=0;
                        this.CCN51=0;
                        this.ICS95=0;
                        this.otros=0;
                        this.injertado=0;
                        this.variedadCriollo=0;
                        this.variedadCCN51=0;
                        this.variedadICS95=0;
                        this.variedadotros=0;
                        this.arbolesProduccion=0;
                        this.estado_id=0;
                        this.mantenimiento_id=[];
                        this.tipoAccion=1;
                        break;
                    }    
                    case 'actualizar':
                    {
                        this.modal=1;
                        this.tituloModal='Actualizar area cultivo cacao';
                        this.tipoAccion=2;
                        this.cultivo_id=data['id'];
                        this.productor_id=data['productor_id'];
                        this.finca_id=data['finca_id'];
                        this.areaTotalCultivo=data['areaTotalCultivo'];
                        this.edadCultivo=data['edadCultivo'];
                        this.criollo=data['criollo'];
                        this.CCN51=data['CCN51'];
                        this.ICS95=data['ICS95'];
                        this.otros=data['otros'];
                        this.injertado=data['injertado'];
                        this.variedadCriollo=data['variedadCriollo'];
                        this.variedadCCN51=data['variedadCCN51'];
                        this.variedadICS95=data['variedadICS95'];
                        this.variedadotros=data['variedadotros'];
                        this.arbolesProduccion=data['arbolesProduccion'];
                        this.estado_id=data['estado_id'];
                        this.mantenimiento_id=data['mantenimiento_id'];
                        break;
                    }       
                }
                }
            }
            this.selectProductor();
            this.selectFinca(this.productor_id);
            this.selectOpcion();
            this.selectEstadoCultivo();   
            this.selectMantenimiento(); 
        }
        },        
        mounted() {
           this.listarCultivo(1,this.buscar,this.criterio);
           
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
<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
