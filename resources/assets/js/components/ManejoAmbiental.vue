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
                        <i class="fa fa-align-justify"></i> Manejo ambiental de la finca
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
                                    <input type="text" v-model="buscar" @keyup.enter="listarAmbiental(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarAmbiental(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
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
                                    <th>Manejo residuos solidos</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="cultivo in arrayAmbiental" :key="cultivo.id">
                                    <td>
                                        <button type="button" @click="abrirModal('cultivo','actualizar',cultivo)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                    </td>
                                    <td v-text="cultivo.nombre_persona"></td>
                                    <td v-text="cultivo.nombre_finca"></td> 
                                    <td v-text="cultivo.nombre_residuo"></td>                                    
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
                                    <label class="col-md-3 form-control-label" for="text-input">Maneja la distancia entre cultivo y fuentes hidricas</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="distanciaFuentes">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>  
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Manejo de  residuos solidos</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="residuo_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="residuo in arrayResiduo" :key="residuo.id" :value="residuo.id" v-text="residuo.nombre" ></option>
                                        </select> 
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Evita la erosion</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="erosion">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>  
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Utiliza elementos de proteccion</label>
                                    <div class="col-md-9">
                                    <select class="form-control" v-model="proteccion">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>  
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Aplica agroquimico</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="agroquimico">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>   
                                    </div>
                                </div> 
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Conserva fauna y flora</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="fauna">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select>   
                                    </div>
                                </div> 
                                <div v-show="errorAmbiental" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjAmbiental" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarAmbiental()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarAmbiental()">Actualizar</button>
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
                ambiental_id:0,
                productor_id:0,
                finca_id:0,
                distanciaFuentes:0,
                residuo_id :0,
                erosion :0,
                proteccion :0,
                agroquimico :0,
                fauna :0,
                arrayAmbiental: [],
                modal: 0,
                tituloModal : '',
                tipoAccion:0,
                errorAmbiental : 0,
                errorMostrarMsjAmbiental:[],
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
                arrayResiduo: []           
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
            listarAmbiental(page,buscar,criterio){
                let me =this;
                var url ='manejoambiental?page='+page + '&buscar='+buscar+'&criterio='+criterio;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayAmbiental= respuesta.ambiental.data;
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
            selectResiduo(){
                let me =this;
                var url ='residuo/selectResiduo';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayResiduo= respuesta.residuo;
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
                me.listarAmbiental(page,buscar,criterio);
            },
            registrarAmbiental(){
            if(this.validarAmbiental()){
                return;
            }
            let me=this;
            axios.post('manejoambiental/registrar',{
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'distanciaFuentes':this.distanciaFuentes,
                'residuo_id':this.residuo_id,
                'erosion':this.erosion,
                'proteccion':this.proteccion,
                'agroquimico':this.agroquimico,
                'fauna':this.fauna
            }).then(function (response) {
                    me.cerrarModal();
                    me.listarAmbiental(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
            actualizarAmbiental(){
            if(this.validarAmbiental()){
                return;
            }
            let me=this;
            console.log(me);
            axios.put('manejoambiental/actualizar',{
                'id':this.ambiental_id,
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'distanciaFuentes':this.distanciaFuentes,
                'residuo_id':this.residuo_id,
                'erosion':this.erosion,
                'proteccion':this.proteccion,
                'agroquimico':this.agroquimico,
                'fauna':this.fauna
                
            }).then(function (response) {
                    console.log(response);
                    me.cerrarModal();
                    me.listarAmbiental(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
        },          
            validarAmbiental(){
            this.errorAmbiental=0;
            this.errorMostrarMsjAmbiental=[];

            
            if(this.productor_id==0)this.errorMostrarMsjAmbiental.push("Debe seleccionar un productor.");
            if(this.finca_id==0)this.errorMostrarMsjAmbiental.push("Debe seleccionar una finca.");
            if(this.errorMostrarMsjAmbiental.length) this.errorAmbiental=1;

            return this.errorAmbiental;
        },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.productor_id=0;
                this.finca_id=0;
                this.distanciaFuentes=0;
                this.residuo_id=0;
                this.erosion=0;
                this.proteccion=0;
                this.agroquimico=0;
                this.fauna=0;
		        this.errorAmbiental=0;
        },
            abrirModal(modelo,accion,data = []){
            switch (modelo) {
                case "cultivo":
                {    
                switch (accion) {
                    case 'registrar':
                    {
                        this.modal = 1;
                        this.tituloModal = 'Registrar manejo ambiental ';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.distanciaFuentes=0;
                        this.residuo_id=0;
                        this.erosion=0;
                        this.proteccion=0;
                        this.agroquimico=0;
                        this.fauna=0;
                        this.tipoAccion=1;
                        break;
                    }    
                    case 'actualizar':
                    {
                        this.modal=1;
                        this.tituloModal='Actualizar manejo ambiental';
                        this.tipoAccion=2;
                        this.ambiental_id=data['id'];
                        this.productor_id=data['productor_id'];
                        this.finca_id=data['finca_id'];
                        this.distanciaFuentes=data['distanciaFuentes'];
                        this.residuo_id=data['residuo_id'];
                        this.erosion=data['erosion'];
                        this.proteccion=data['proteccion'];
                        this.agroquimico=data['agroquimico'];
                        this.fauna=data['fauna'];
                        break;
                    }       
                }
                }
            }
            this.selectProductor();
            this.selectFinca(this.productor_id);
            this.selectOpcion();
            this.selectResiduo();    
        }
        },        
        mounted() {
           this.listarAmbiental(1,this.buscar,this.criterio);
           
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