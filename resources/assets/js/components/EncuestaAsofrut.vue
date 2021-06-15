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
                        <i class="fa fa-align-justify"></i> Visita Tecnica
                        <button type="button" @click="abrirModal('encuesta','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="personas">Productor</option>
                                      
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarEncuesta(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarEncuesta(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class='table-responsive'>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Detalle</th>
                                    <th>Productor</th>
                                    <th>Finca</th>
                                    <th>Fecha visita</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <tr v-for="encuesta in arrayEncuesta" :key="encuesta.id">
                                    <td>
                                        <button type="button" @click="abrirModal('encuesta','actualizar',encuesta)" class="btn btn-warning btn-sm">
                                          <i class="icon-eye"></i>
                                        </button> &nbsp;
                                    </td> 
                                    <td v-text="encuesta.nombre"></td>
                                    <td v-text="encuesta.nombre_finca"></td> 
                                    <td v-text="encuesta.created_at"></td>                                  
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
                                    <label class="col-md-3 form-control-label" for="text-input">Tipo Visita</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="ecosistemas5">
                                            <option value="0" disabled>Seleccione</option>
                                            <option value="Linea base">Linea Base</option>
                                            <option value="Seguimiento">Seguimiento</option>
                                      </select>  
                                    </div>
                                 </div>
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
                                      <label class="col-md-3 form-control-label" for="number-input">Area Produccion(Hectareas)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Siembra Nueva(Hectareas)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                     <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Edad del cultivo</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input"># De arboles sembrados</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                     <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Arboles en produccion</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                     <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Produccion Mensual(Kg)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                    </div>
                                 <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Tipo</label>
                                    <div class="col-md-9">
                                      <select class="form-control" v-model="ecosistemas5">
                                            <option value="0" disabled>Seleccione</option>
                                            <option value="Fresco">Fresco</option>
                                            <option value="Seco">Seco</option>
                                      </select>  
                                    </div>
                                 </div>
                                  <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Vendido(Kg)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                  </div>
                                   <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Por vender(Kg)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                  </div>
                              
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label">A quien vende?</label>
                                    <div class="col-md-9">
                                    <v-select
                                        :on-search="selectLugarVenta"
                                        label="nombre"
                                        :options="arrayLugarVenta"
                                        placeholder="Buscar punto de venta..."
                                        :onChange="getDatosLugarVenta"                                        
                                    >
                                    </v-select>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="text-input">Objetivos</label>
                                      <div class="col-md-9">
                                        <input type="text" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Cumplimiento a compromisos(%)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="text-input">Estado actual de la finca</label>
                                      <div class="col-md-9">
                                        <input type="text" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="text-input">Recomendaciones tecnicas-ambientales</label>
                                      <div class="col-md-9">
                                        <input type="text" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                 <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="text-input">Observaciones</label>
                                      <div class="col-md-9">
                                        <input type="text" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                 <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Nivel de satisfaccion con la asistencia tecnica(%)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>
                                <div class="form-group row">
                                      <label class="col-md-3 form-control-label" for="number-input">Nivel de satisfaccion con el servicio de la empresa(%)</label>
                                      <div class="col-md-9">
                                        <input type="number" v-model="silvestre12"  class="form-control" placeholder="">
                                      </div>
                                </div>



                                   

                                <div v-show="errorEncuesta" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjEncuesta" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarEncuesta()">Guardar</button>
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
import vSelect from 'vue-select';
    export default {
        data(){
            return{
                encuestaAsofrut_id:0,
                productor_id:0,
                finca_id:0,
                certificacion1:'',
                certificacion2:'',
                lugarVenta_id:0,
                lugarVenta:'',
                arrayLugarVenta: [],
                ecosistemas1:'', 
                ecosistemas2:'',
                ecosistemas3:'',
                ecosistemas4:'',
                ecosistemas5:'',
                ecosistemas6:'',
                ecosistemas7:'',
                ecosistemas8:'',
                silvestre1:'',
                silvestre2:'',
                silvestre3:'',
                silvestre4:'',
                silvestre5:'',
                silvestre6:'',
                silvestre7:'',
                silvestre8:'',
                silvestre9:'',
                silvestre10:'',
                silvestre11:'',
                silvestre12:'',
                silvestre13:'',
                silvestre14:'',
                silvestre15:'',
                silvestre16:'',
                silvestre17:'',
                silvestre18:'',
                silvestre19:'',
                silvestre20:'',
                conservacion1:'',
                conservacion2:'',
                conservacion3:'',
                conservacion4:'',
                conservacion5:'',
                conservacion6:'',
                desechos1:'',
                desechos2:'',
                desechos3:'',
                desechos4:'',
                cultivo:'',
                arrayEncuesta: [],
                modal: 0,
                tituloModal : '',
                tipoAccion:0,
                errorEncuesta : 0,
                errorMostrarMsjEncuesta:[],
                pagination:{
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset:3,
                criterio: 'personas',
                buscar: '',
                arrayProductor : [],
                arrayFinca : []                  
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
            listarEncuesta(page,buscar,criterio){
                let me =this;
                var url ='visita?page='+page + '&buscar='+buscar+'&criterio='+criterio;
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEncuesta= respuesta.encuestas.data;
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
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza a la pagina actual
                me.pagination.current_page = page;
                //Envia la peticion para visualizar la data de esa pagina
                me.listarEncuesta(page,buscar,criterio);
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
            registrarEncuesta(){
            if(this.validarEncuesta()){
                return;
            }
            let me=this;
            axios.post('visita/registrar',{
                'productor_id':this.productor_id,
                'finca_id':this.finca_id,
                'certificacion1':this.certificacion1,
                'certificacion2':this.certificacion2,
                'ecosistemas1':this.ecosistemas1, 
                'ecosistemas2':this.ecosistemas2,
                'ecosistemas3':this.ecosistemas3,
                'ecosistemas4':this.ecosistemas4,
                'ecosistemas5':this.ecosistemas5,
                'ecosistemas6':this.ecosistemas6,
                'ecosistemas7':this.ecosistemas7,
                'ecosistemas8':this.ecosistemas8,
                'silvestre1':this.silvestre1,
                'silvestre2':this.silvestre2,
                'silvestre3':this.silvestre3,
                'silvestre4':this.silvestre4,
                'silvestre5':this.silvestre5,
                'silvestre6':this.silvestre6,
                'silvestre7':this.silvestre7,
                'silvestre8':this.silvestre8,
                'silvestre9':this.silvestre9,
                'silvestre10':this.silvestre10,
                'silvestre11':this.silvestre11,
                'silvestre12':this.silvestre12,
                'silvestre13':this.silvestre13,
                'silvestre14':this.silvestre14,
                'silvestre15':this.silvestre15,
                'silvestre16':this.silvestre16,
                'silvestre17':this.silvestre17,
                'silvestre18':this.silvestre18,
                'silvestre19':this.silvestre19,
                'silvestre20':this.silvestre20,
                'conservacion1':this.conservacion1,
                'conservacion2':this.conservacion2,
                'conservacion3':this.conservacion3,
                'conservacion4':this.conservacion4,
                'conservacion5':this.conservacion5,
                'conservacion6':this.conservacion6,
                'desechos1':this.desechos1,
                'desechos2':this.desechos2,
                'desechos3':this.desechos3,
                'desechos4':this.desechos4,
                'cultivo':this.cultivo,               
            }).then(function (response) {
                    me.cerrarModal();
                    me.listarEncuesta(1,'','personas');
                })
                .catch(function (error) {
                    console.log(error);
                });

        },    
            validarEncuesta(){
            this.errorEncuesta=0;
            this.errorMostrarMsjEncuesta=[];
            if(this.productor_id==0)this.errorMostrarMsjEncuesta.push("Debe seleccionar un productor");
            if(this.finca_id==0)this.errorMostrarMsjEncuesta.push("Debe seleccionar una finca.");
            if(this.errorMostrarMsjEncuesta.length) this.errorEncuesta=1;

            return this.errorEncuesta;
        },
            cerrarModal(){
                        this.modal=0;
                        this.tituloModal='';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.certificacion1=0;
                        this.certificacion2=0;
                        this.ecosistemas1=0; 
                        this.ecosistemas2=0;
                        this.ecosistemas3=0;
                        this.ecosistemas4=0;
                        this.ecosistemas5=0;
                        this.ecosistemas6=0;
                        this.ecosistemas7=0;
                        this.ecosistemas8=0;
                        this.silvestre1=0;
                        this.silvestre2=0;
                        this.silvestre3=0;
                        this.silvestre4=0;
                        this.silvestre5=0;
                        this.silvestre6=0;
                        this.silvestre7=0;
                        this.silvestre8=0;
                        this.silvestre9=0;
                        this.silvestre10=0;
                        this.silvestre11=0;
                        this.silvestre12='';
                        this.silvestre13=0;
                        this.silvestre14='';
                        this.silvestre15=0;
                        this.silvestre16=0;
                        this.silvestre17='';
                        this.silvestre18=0;
                        this.silvestre19=0;
                        this.silvestre20=0;
                        this.conservacion1=0;
                        this.conservacion2='';
                        this.conservacion3=0;
                        this.conservacion4=0;
                        this.conservacion5=0;
                        this.conservacion6=0;
                        this.desechos1=0;
                        this.desechos2=0;
                        this.desechos3=0;
                        this.desechos4=0;
                        this.cultivo=0;    
		                this.errorEncuesta=0;
        },
            abrirModal(modelo,accion,data = []){
            switch (modelo) {
                case "encuesta":
                {    
                switch (accion) {
                    case 'registrar':
                    {
                        this.modal = 1;
                        this.tituloModal = 'Registrar visita tecnica';
                        this.productor_id=0;
                        this.finca_id=0;
                        this.certificacion1=0;
                        this.certificacion2=0;
                        this.ecosistemas1=0; 
                        this.ecosistemas2=0;
                        this.ecosistemas3=0;
                        this.ecosistemas4=0;
                        this.ecosistemas5=0;
                        this.ecosistemas6=0;
                        this.ecosistemas7=0;
                        this.ecosistemas8=0;
                        this.silvestre1=0;
                        this.silvestre2=0;
                        this.silvestre3=0;
                        this.silvestre4=0;
                        this.silvestre5=0;
                        this.silvestre6=0;
                        this.silvestre7=0;
                        this.silvestre8=0;
                        this.silvestre9=0;
                        this.silvestre10=0;
                        this.silvestre11=0;
                        this.silvestre12='';
                        this.silvestre13=0;
                        this.silvestre14='';
                        this.silvestre15=0;
                        this.silvestre16=0;
                        this.silvestre17='';
                        this.silvestre18=0;
                        this.silvestre19=0;
                        this.silvestre20=0;
                        this.conservacion1=0;
                        this.conservacion2='';
                        this.conservacion3=0;
                        this.conservacion4=0;
                        this.conservacion5=0;
                        this.conservacion6=0;
                        this.desechos1=0;
                        this.desechos2=0;
                        this.desechos3=0;
                        this.desechos4=0;
                        this.cultivo=0;        
                        this.tipoAccion=1;
                        break;
                    }  case 'actualizar':
                    {
                        this.modal=1;
                        this.tituloModal='Detalle visita tecnica';
                        this.tipoAccion=2;
                        this.encuestaAsofrut_id=data['id'];
                        this.productor_id=data['productor_id'];
                        this.finca_id=data['finca_id'];
                        this.certificacion1=data['certificacion1'];
                        this.certificacion2=data['certificacion2'];
                        this.ecosistemas1=data['ecosistemas1']; 
                        this.ecosistemas2=data['ecosistemas2'];
                        this.ecosistemas3=data['ecosistemas3'];
                        this.ecosistemas4=data['ecosistemas4'];
                        this.ecosistemas5=data['ecosistemas5'];
                        this.ecosistemas6=data['ecosistemas6'];
                        this.ecosistemas7=data['ecosistemas7'];
                        this.ecosistemas8=data['ecosistemas8'];
                        this.silvestre1=data['silvestre1'];
                        this.silvestre2=data['silvestre2'];
                        this.silvestre3=data['silvestre3'];
                        this.silvestre4=data['silvestre4'];
                        this.silvestre5=data['silvestre5'];
                        this.silvestre6=data['silvestre6'];
                        this.silvestre7=data['silvestre7'];
                        this.silvestre8=data['silvestre8'];
                        this.silvestre9=data['silvestre9'];
                        this.silvestre10=data['silvestre10'];
                        this.silvestre11=data['silvestre11'];
                        this.silvestre12=data['silvestre12'];
                        this.silvestre13=data['silvestre13'];
                        this.silvestre14=data['silvestre14'];
                        this.silvestre15=data['silvestre15'];
                        this.silvestre16=data['silvestre16'];
                        this.silvestre17=data['silvestre17'];
                        this.silvestre18=data['silvestre18'];
                        this.conservacion1=data['conservacion1'];
                        this.conservacion2=data['conservacion2'];
                        this.conservacion3=data['conservacion3'];
                        this.conservacion4=data['conservacion4'];
                        this.conservacion5=data['conservacion5'];
                        this.conservacion6=data['conservacion6'];
                        this.desechos1=data['desechos1'];
                        this.desechos2=data['desechos2'];
                        this.desechos3=data['desechos3'];
                        this.desechos4=data['desechos4'];
                        this.cultivo=data['cultivo'];  
                        break
                    }       
                }
                }
            }
            this.selectProductor();
            this.selectFinca(this.productor_id);   
        }
        },        
        mounted() {
           this.listarEncuesta(1,this.buscar,this.criterio);
           
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