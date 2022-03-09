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
                        <i class="fa fa-align-justify"></i> Componente Social Productor
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
                                        <td v-text="arrayTipoId[productor.tipo_id-1].nombre"></td>
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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Nombre Productor</label>
                                     <input type="text" v-model="nombre"  class="form-control" placeholder="Nombre del productor">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo documento</label>
                                     <select class="form-control" v-model="tipo_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="tipoId in arrayTipoId" :key="tipoId.id" :value="tipoId.id" v-text="tipoId.nombre" ></option>
                                      </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Numero Documento</label>
                                      <input type="number" v-model="num_documento"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Telefono</label>
                                       <input type="number" v-model="telefono"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Correo electronico </label>
                                    <input type="text" v-model="email" class="form-control" >
                                </div>
                            </div>
                        </div>
                          <div class="form-group row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Estado Civil</label>
                                    <select class="form-control" v-model="estadoCivil_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="estadoCivil in arrayEstadoCivil" :key="estadoCivil.id" :value="estadoCivil.id" v-text="estadoCivil.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Etnia</label>
                                      <select class="form-control" v-model="etnia_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="etnia in arrayEtnia" :key="etnia.id" :value="etnia.id" v-text="etnia.nombre" ></option>
                                      </select>    
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Sexo</label>
                                       <select class="form-control" v-model="sexo_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="sexo in arraySexo" :key="sexo.id" :value="sexo.id" v-text="sexo.nombre" ></option>
                                      </select>  
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Fecha nacimiento</label>
                                       <v-datepicker  v-model="fechaNacimiento"></v-datepicker>
                                </div>
                            </div>
                           <div class="col-md-2">
                                <div class="form-group">
                                    <label>Zona </label>
                                    <select class="form-control" v-model="zona_id" @click="selectVereda(zona_id)" @change="selectVereda(zona_id)">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="arrayZona in arrayZona" :key="arrayZona.id" :value="arrayZona.id" v-text="arrayZona.nombre" ></option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Vereda</label>
                                    <select class="form-control" v-model="vereda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="vereda in arrayVereda" :key="vereda.id" :value="vereda.id" v-text="vereda.nombre" ></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                         <div class="form-group">
                            <div class="table-responsive col-md-12">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nombre</th>
                                            <th>Parentesco</th>
                                            <th>Numero Documento</th>
                                            <th>Fecha Nacimiento</th>
                                            <th>Nivel de Estudios</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="text" v-model="NombreP1"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="parentesco1">
                                                <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP1"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP1"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP1">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco2">
                                                    <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP2"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP2"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP2">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco3">
                                                   <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP3"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP3"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP3">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco4">
                                                  <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP4"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP4"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP4">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco5">
                                                    <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP5"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP5"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP5">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
                                            </td>   
                                        </tr>
                                    </tbody>                             
                                </table>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Vivienda</label>
                                    <select class="form-control" v-model="vivienda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="vivienda in arrayVivienda" :key="vivienda.id" :value="vivienda.id" v-text="vivienda.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo Vivienda</label>
                                     <select class="form-control" v-model="tipovivienda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="tipovivienda in arrayTipoVivienda" :key="tipovivienda.id" :value="tipovivienda.id" v-text="tipovivienda.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Estudios</label>
                                       <select class="form-control" v-model="escolaridad_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Carnet Salud</label>
                                       <select class="form-control" v-model="carnetSalud">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Discapacitado</label>
                                        <select class="form-control" v-model="discapacitado">
                                           <option value="0" disabled>Seleccione</option>
                                           <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Personas a cargo</label>
                                    <input type="number" v-model="personasAcargo"  class="form-control" placeholder="">  
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Desplazado</label>
                                    <select class="form-control" v-model="desplazado">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Asociacion</label>
                                    <select class="form-control" v-model="asociacion_id">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="asociacion in arrayAsociacion" :key="asociacion.id" :value="asociacion.id" v-text="asociacion.nombre" ></option>
                                    </select>   
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Programa del Estado</label>
                                       <select class="form-control" v-model="programaEstado_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="programa in arrayProgramaEstado" :key="programa.id" :value="programa.id" v-text="programa.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Asistencia Tecnica</label>
                                       <select class="form-control" v-model="asistencia">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Entidad</label>
                                    <select class="form-control" v-model="entidad">
                                            <option value="Seleccione" disabled>Seleccione</option>
                                            <option value="Fedecacao" >Fedecacao</option>
                                            <option value="Comcacaot" >Comcacaot</option>
                                            <option value="Asproca" >Asproca</option>
                                            <option value="Chocolate Tumaco" >Chocolate Tumaco</option>
                                            <option value="Alcaldía" >Alcaldía</option>
                                            <option value="Otros" >Otros</option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label>Capacitacion</label>
                                     <select class="form-control" v-model="capacitacion">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                    </select>   
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Temas</label>
                                    <input type="text" v-model="temas"  class="form-control" placeholder="">     
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div v-show="errorProductor" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjProductor" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <button type="button" @click="ocultarDetalle()" class="btn btn-secondary">Cerrar</button>
                                <button type="button" class="btn btn-primary" @click="registrarProductor()">Registrar</button>
                            </div>
                        </div>
                    </div>
                    </template>
                    <!-- Fin Detalle-->
                    <!-- Ver ingreso -->
                     <template v-else-if="listado==2">
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Nombre Productor</label>
                                     <input type="text" v-model="nombre"  class="form-control" placeholder="Nombre del productor">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo documento</label>
                                     <select class="form-control" v-model="tipo_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="tipoId in arrayTipoId" :key="tipoId.id" :value="tipoId.id" v-text="tipoId.nombre" ></option>
                                      </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Numero Documento</label>
                                      <input type="number" v-model="num_documento"  class="form-control" placeholder="">
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Telefono</label>
                                       <input type="number" v-model="telefono"  class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Correo electronico </label>
                                    <input type="text" v-model="email" class="form-control" >
                                </div>
                            </div>
                        </div>
                          <div class="form-group row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Estado Civil</label>
                                    <select class="form-control" v-model="estadoCivil_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="estadoCivil in arrayEstadoCivil" :key="estadoCivil.id" :value="estadoCivil.id" v-text="estadoCivil.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Etnia</label>
                                      <select class="form-control" v-model="etnia_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="etnia in arrayEtnia" :key="etnia.id" :value="etnia.id" v-text="etnia.nombre" ></option>
                                      </select>    
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Sexo</label>
                                       <select class="form-control" v-model="sexo_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="sexo in arraySexo" :key="sexo.id" :value="sexo.id" v-text="sexo.nombre" ></option>
                                      </select>  
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Fecha nacimiento</label>
                                       <v-datepicker  v-model="fechaNacimiento"></v-datepicker>
                                </div>
                            </div>
                           <div class="col-md-2">
                                <div class="form-group">
                                    <label>Zona </label>
                                    <select class="form-control" v-model="zona_id" @click="selectVereda(zona_id)" @change="selectVereda(zona_id)">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="arrayZona in arrayZona" :key="arrayZona.id" :value="arrayZona.id" v-text="arrayZona.nombre" ></option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Vereda</label>
                                    <select class="form-control" v-model="vereda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="vereda in arrayVeredaView" :key="vereda.id" :value="vereda.id" v-text="vereda.nombre" ></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                         <div class="form-group">
                            <div class="table-responsive col-md-12">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nombre</th>
                                            <th>Parentesco</th>
                                            <th>Numero Documento</th>
                                            <th>Fecha Nacimiento</th>
                                            <th>Nivel de Estudios</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="text" v-model="NombreP1"  class="form-control" placeholder="Nombre"> 
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="parentesco1">
                                                <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP1"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP1"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP1">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco2">
                                                    <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP2"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP2"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP2">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco3">
                                                   <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP3"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP3"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP3">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco4">
                                                  <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP4"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP4"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP4">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
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
                                                <select class="form-control" v-model="parentesco5">
                                                    <option v-for="parentesco in arrayParentesco" :key="parentesco.id" :value="parentesco.id" v-text="parentesco.nombre" ></option>
                                                </select>  
                                            </td>
                                            <td>
                                             <input type="number" v-model="ccP5"  class="form-control" placeholder="">
                                            </td>
                                            <td>
                                            <v-datepicker  v-model="fechaNacimientoP5"></v-datepicker>
                                            </td>
                                            <td>
                                                <select class="form-control" v-model="escolaridad_idP5">
                                                    <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                                </select>
                                            </td>   
                                        </tr>
                                    </tbody>                             
                                </table>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Vivienda</label>
                                    <select class="form-control" v-model="vivienda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="vivienda in arrayVivienda" :key="vivienda.id" :value="vivienda.id" v-text="vivienda.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Tipo Vivienda</label>
                                     <select class="form-control" v-model="tipovivienda_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="tipovivienda in arrayTipoVivienda" :key="tipovivienda.id" :value="tipovivienda.id" v-text="tipovivienda.nombre" ></option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Estudios</label>
                                       <select class="form-control" v-model="escolaridad_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="escolaridad in arrayEscolaridad" :key="escolaridad.id" :value="escolaridad.id" v-text="escolaridad.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Carnet Salud</label>
                                       <select class="form-control" v-model="carnetSalud">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Discapacitado</label>
                                        <select class="form-control" v-model="discapacitado">
                                           <option value="0" disabled>Seleccione</option>
                                           <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Personas a cargo</label>
                                    <input type="number" v-model="personasAcargo"  class="form-control" placeholder="">  
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label for="">Desplazado</label>
                                    <select class="form-control" v-model="desplazado">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                    </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Asociacion</label>
                                    <select class="form-control" v-model="asociacion_id">
                                        <option value="0" disabled>Seleccione</option>
                                        <option v-for="asociacion in arrayAsociacion" :key="asociacion.id" :value="asociacion.id" v-text="asociacion.nombre" ></option>
                                    </select>   
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Programa del Estado</label>
                                       <select class="form-control" v-model="programaEstado_id">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="programa in arrayProgramaEstado" :key="programa.id" :value="programa.id" v-text="programa.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                             <div class="col-md-2">
                                <div class="form-group">
                                    <label for="">Asistencia Tecnica</label>
                                       <select class="form-control" v-model="asistencia">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                        </select> 
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Entidad</label>
                                    <select class="form-control" v-model="entidad">
                                            <option value="Seleccione" disabled>Seleccione</option>
                                            <option value="Fedecacao" >Fedecacao</option>
                                            <option value="Comcacaot" >Comcacaot</option>
                                            <option value="Asproca" >Asproca</option>
                                            <option value="Chocolate Tumaco" >Chocolate Tumaco</option>
                                            <option value="Alcaldía" >Alcaldía</option>
                                            <option value="Otros" >Otros</option>
                                    </select>  
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="form-group">
                                    <label>Capacitacion</label>
                                     <select class="form-control" v-model="capacitacion">
                                            <option value="0" disabled>Seleccione</option>
                                            <option v-for="opcion in arrayOpcion" :key="opcion.id" :value="opcion.id" v-text="opcion.nombre" ></option>
                                    </select>   
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Temas</label>
                                    <input type="text" v-model="temas"  class="form-control" placeholder="">     
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div v-show="errorProductor" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjProductor" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>
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
                nombre:'',
                tipo_id:0,
                num_documento : '',
                direccion : '',
                telefono : '',
                email : '',   
                estadoCivil_id:0,
                etnia_id:0,
                sexo_id:0,
                fechaNacimiento:'',
                zona_id:0,
                zona:'', 
                vereda_id:0,
                vivienda_id:0,
                tipovivienda_id:0,
                escolaridad_id:0,
                carnetSalud:0,
                discapacitado:0,
                personasAcargo:0,
                desplazado:0,
                asociacion_id:0,
                programaEstado_id:0,
                asistencia:0,
                entidad:'Seleccione',
                capacitacion:0,
                temas:'',
                parentesco1:'',
                NombreP1:'',
                ccP1:0,
                fechaNacimientoP1:'',
                escolaridad_idP1:'',
                parentesco2:'',
                NombreP2:'',
                ccP2:0,
                fechaNacimientoP2:'',
                escolaridad_idP2:'',
                parentesco3:'',
                NombreP3:'',
                ccP3:0,
                fechaNacimientoP3:'',
                escolaridad_idP3:'',
                parentesco4:'',
                NombreP4:'',
                ccP4:0,
                fechaNacimientoP4:'',
                escolaridad_idP4:'',
                parentesco5:'',
                NombreP5:'',
                ccP5:0,
                fechaNacimientoP5:'',
                escolaridad_idP5:'',

                arrayTipoId:[],
                arrayEstadoCivil:[],
                arrayEtnia:[],
                arraySexo:[],
                arrayProductor : [],
                arrayVereda:[],
                arrayZona:[],
                arrayParentesco:[],
                arrayEscolaridad:[],
                arrayLugarVenta: [],
                arrayLinea:[],
                arrayVivienda:[],
                arrayTipoVivienda:[],
                arrayOpcion:[],
                arrayAsociacion:[],
                arrayProgramaEstado:[],
                arrayProductorT:[],
                arrayVeredaView:[],
                
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
                this.selectTipoId();
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
             selectTipoId(){
                let me =this;
                var url ='tipoId/selectTipoId';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayTipoId= respuesta.tipoIds;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             selectEstadoCivil(){
                let me =this;
                var url ='estadoCivil/selectEstadoCivil';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEstadoCivil= respuesta.estadoCivil;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectEtnia(){
                let me =this;
                var url ='etnia/selectEtnia';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEtnia= respuesta.etnias;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             selectSexo(){
                let me =this;
                var url ='sexo/selectSexo';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arraySexo= respuesta.sexos;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             selectParentesco(){
                let me =this;
                var url ='parentesco/selectParentesco';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayParentesco= respuesta.parentescos;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             selectEscolaridad(){
                let me =this;
                var url ='escolaridad/selectEscolaridad';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayEscolaridad= respuesta.grados;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectVivienda(){
                let me =this;
                var url ='vivienda/selectVivienda';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayVivienda= respuesta.viviendas;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectTipoVivienda(){
                let me =this;
                var url ='tipoVivienda/selectTipoVivienda';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayTipoVivienda= respuesta.tipoViviendas;
                })
                .catch(function (error) {
                    console.log(error);
                });
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
             selectAsociacion(){
                let me =this;
                var url ='asociacion/selectAsociacion';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayAsociacion= respuesta.asociaciones;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            selectProgramaEstado(){
                let me =this;
                var url ='estado/selectProgramaEstado';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayProgramaEstado= respuesta.programasEstado;
                })
                .catch(function (error) {
                    console.log(error);
                });
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
             selectVeredaView(){
                let me =this;
                var url ='vereda/selectVereda';
                axios.get(url).then(function (response) {
                    var respuesta = response.data;
                    me.arrayVeredaView= respuesta.veredas;
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
            selectLinea(search,loading){
                let me=this;
                loading(true)

                var url= 'linea/selectLinea2?filtro='+search;
                axios.get(url).then(function (response) {
                    let respuesta = response.data;
                    q: search
                    me.arrayLinea=respuesta.lineas;
                    loading(false)
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getDatosLinea(val1){
                let me = this;
                me.loading = true;
                me.linea_id = val1.id;
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
            registrarProductor(){
                if (this.validarProductor()){
                    return;
                }
                
                let me = this;
                axios.post('productor/registrar',{
                    'nombre':this.nombre,
                    'tipo_id':this.tipo_id,
                    'num_documento' :this.num_documento,
                    'direccion' :this.direccion,
                    'telefono' :this.telefono,
                    'email' :this.email,   
                    'estadoCivil_id':this.estadoCivil_id,
                    'etnia_id':this.etnia_id,
                    'sexo_id':this.sexo_id,
                    'fechaNacimiento':this.fechaNacimiento,
                    'vereda_id':this.vereda_id,
                    'zona_id':this.zona_id,
                    'vivienda_id':this.vivienda_id,
                    'tipovivienda_id':this.tipovivienda_id,
                    'escolaridad_id':this.escolaridad_id,
                    'carnetSalud':this.carnetSalud,
                    'discapacitado':this.discapacitado,
                    'personasAcargo':this.personasAcargo,
                    'desplazado':this.desplazado,
                    'asociacion_id':this.asociacion_id,
                    'programaEstado_id':this.programaEstado_id,
                    'asistencia':this.asistencia,
                    'entidad':this.entidad,
                    'capacitacion':this.capacitacion,
                    'temas':this.temas,
                    'parentesco1':this.parentesco1,
                    'NombreP1':this.NombreP1,
                    'ccP1':this.ccP1,
                    'fechaNacimientoP1':this.fechaNacimientoP1,
                    'escolaridad_idP1':this.escolaridad_idP1,
                    'parentesco2':this.parentesco2,
                    'NombreP2':this.NombreP2,
                    'ccP2':this.ccP2,
                    'fechaNacimientoP2':this.fechaNacimientoP2,
                    'escolaridad_idP2':this.escolaridad_idP2,
                    'parentesco3':this.parentesco3,
                    'NombreP3':this.NombreP3,
                    'ccP3':this.ccP3,
                    'fechaNacimientoP3':this.fechaNacimientoP3,
                    'escolaridad_idP3':this.escolaridad_idP3,
                    'parentesco4':this.parentesco4,
                    'NombreP4':this.NombreP4,
                    'ccP4':this.ccP4,
                    'fechaNacimientoP4':this.fechaNacimientoP4,
                    'escolaridad_idP4':this.escolaridad_idP4,
                    'parentesco5':this.parentesco5,
                    'NombreP5':this.NombreP5,
                    'ccP5':this.ccP5,
                    'fechaNacimientoP5':this.fechaNacimientoP5,
                    'escolaridad_idP5':this.escolaridad_idP5
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
                    me.zona_id=0;
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
                    me.entidad='Seleccione';
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
            validarProductor(){
                this.errorProductor=0;
                this.errorMostrarMsjProductor =[];

                if (this.tipo_id==0) this.errorMostrarMsjProductor.push("Seleccione un tipo de documento");
                if (this.estadoCivil_id==0) this.errorMostrarMsjProductor.push("Seleccione su estado civil");
                if (this.etnia_id==0) this.errorMostrarMsjProductor.push("Seleccione su etnia");
                if (this.sexo_id==0) this.errorMostrarMsjProductor.push("Seleccione su sexo");
                if (this.vereda_id==0) this.errorMostrarMsjProductor.push("Seleccione el lugar donde vive");
                if (this.vivienda_id==0) this.errorMostrarMsjProductor.push("Seleccione su vivienda ");
                if (this.tipovivienda_id==0) this.errorMostrarMsjProductor.push("Seleccione el tipo de vivienda");
                if (this.escolaridad_id==0) this.errorMostrarMsjProductor.push("Seleccione su grado de escolaridad");
                if (this.carnetSalud==0) this.errorMostrarMsjProductor.push("Seleccione opcion carnet salud");
                if (this.discapacitado==0) this.errorMostrarMsjProductor.push("Seleccione opcion discapacitado");
                if (this.desplazado==0) this.errorMostrarMsjProductor.push("Seleccione opcion desplazado");
                if (this.asociacion_id==0) this.errorMostrarMsjProductor.push("Seleccione la asociacion a la que pertenece");
                if (this.programasEstado==0) this.errorMostrarMsjProductor.push("Seleccione el programa del estado al que se encuentra inscrito");
                if (this.asistencia==0) this.errorMostrarMsjProductor.push("Seleccione opcion asistencia");
                if (this.capacitacion==0) this.errorMostrarMsjProductor.push("Seleccione opcion capacitacion");

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
                this.selectTipoId();
                this.selectEstadoCivil();
                this.selectEtnia();
                this.selectSexo();
                this.selectParentesco();
                this.selectEscolaridad();
                this.selectVivienda();
                this.selectTipoVivienda();
                this.selectOpcion();
                this.selectAsociacion();
                this.selectProgramaEstado();
                this.selectZona();
                this.selectVereda(this.zona_id);
            },
            ocultarDetalle(){
                let me=this;
                this.listado=1;
                this.selectTipoId();
                this.selectEstadoCivil();
                this.selectEtnia();
                this.selectSexo();
                this.selectParentesco();
                this.selectEscolaridad();
                this.selectVivienda();
                this.selectTipoVivienda();
                this.selectOpcion();
                this.selectAsociacion();
                this.selectProgramaEstado();
                this.selectZona();
                this.selectVereda(this.zona_id);
                me.nombre ='';
                me.tipo_id = 0;
                me.num_documento = '';
                me.telefono = '';
                me.email = '';
                me.estadoCivil_id = 0;
                me.etnia_id = 0
                me.sexo_id =0;
                me.fechaNacimiento = '';
                me.zona_id = 0;
                me.vereda_id =0;
                me.vivienda_id = 0;
                me.tipovivienda_id = 0;
                me.escolaridad_id = 0;
                me.carnetSalud = 0;
                me.discapacitado = 0;
                me.personasAcargo = 0;
                me.desplazado =0;
                me.asociacion_id = 0;                   
                me.programaEstado_id =0;                   
                me.asistencia = 0;                   
                me.entidad ='Seleccione'; 
                me.capacitacion = 0;                   
                me.temas = '';
                me.NombreP1 = '';
                me.parentesco1 =0;
                me.ccP1 ='';
                me.fechaNacimientoP1 ='';
                me.escolaridad_idP1 =0;

                me.NombreP2 = '';
                me.parentesco2 =0;
                me.ccP2 ='';
                me.fechaNacimientoP2 ='';
                me.escolaridad_idP2 =0;

                me.NombreP3 = '';
                me.parentesco3 =0;
                me.ccP3 ='';
                me.fechaNacimientoP3 ='';
                me.escolaridad_idP3 =0;

                me.NombreP4 = '';
                me.parentesco4 =0;
                me.ccP4 ='';
                me.fechaNacimientoP4 ='';
                me.escolaridad_idP4 =0;

                me.NombreP5 = '';
                me.parentesco5 =0;
                me.ccP5 ='';
                me.fechaNacimientoP5 ='';
                me.escolaridad_idP5 =0;

            },
            verVenta(id){
                let me=this;
                var url= 'productor/' + id;
                    this.selectEstadoCivil();
                    this.selectEtnia();
                    this.selectSexo();
                    this.selectParentesco();
                    this.selectEscolaridad();
                    this.selectVivienda();
                    this.selectTipoVivienda();
                    this.selectOpcion();
                    this.selectAsociacion();
                    this.selectProgramaEstado();
                    this.selectZona();
                    this.selectVeredaView();
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayProductorT = respuesta.personas;
                    me.nombre = me.arrayProductorT[0]['nombre'];
                    me.tipo_id = me.arrayProductorT[0]['tipo_id'];
                    me.num_documento = me.arrayProductorT[0]['num_documento'];
                    me.telefono = me.arrayProductorT[0]['telefono'];
                    me.email = me.arrayProductorT[0]['email'];
                    me.estadoCivil_id = me.arrayProductorT[0]['estadoCivil_id'];
                    me.etnia_id = me.arrayProductorT[0]['etnia_id'];
                    me.sexo_id = me.arrayProductorT[0]['sexo_id'];
                    me.fechaNacimiento = me.arrayProductorT[0]['fechaNacimiento'];
                    me.zona_id = me.arrayProductorT[0]['zona_id'];
                    me.vereda_id = me.arrayProductorT[0]['vereda_id'];
                    me.vivienda_id = me.arrayProductorT[0]['vivienda_id'];
                    me.tipovivienda_id = me.arrayProductorT[0]['tipovivienda_id'];
                    me.escolaridad_id = me.arrayProductorT[0]['escolaridad_id'];
                    me.carnetSalud = me.arrayProductorT[0]['carnetSalud'];
                    me.discapacitado = me.arrayProductorT[0]['discapacitado'];
                    me.personasAcargo = me.arrayProductorT[0]['personasAcargo'];
                    me.desplazado = me.arrayProductorT[0]['desplazado'];
                    me.asociacion_id = me.arrayProductorT[0]['asociacion_id'];                   
                    me.programaEstado_id = me.arrayProductorT[0]['programaEstado_id'];                   
                    me.asistencia = me.arrayProductorT[0]['asistencia'];                   
                    me.entidad = me.arrayProductorT[0]['entidad']; 
                    me.capacitacion = me.arrayProductorT[0]['capacitacion'];                   
                    me.temas = me.arrayProductorT[0]['temas'];
                    me.NombreP1 = me.arrayProductorT[0]['NombreP1'];
                    me.parentesco1 =me.arrayProductorT[0]['parentesco1'];
                    me.ccP1 =me.arrayProductorT[0]['ccP1'];
                    me.fechaNacimientoP1 =me.arrayProductorT[0]['fechaNacimientoP1'];
                    me.escolaridad_idP1 =me.arrayProductorT[0]['escolaridad_idP1'];

                    me.NombreP2 = me.arrayProductorT[0]['NombreP2'];
                    me.parentesco2 =me.arrayProductorT[0]['parentesco2'];
                    me.ccP2 =me.arrayProductorT[0]['ccP2'];
                    me.fechaNacimientoP2 =me.arrayProductorT[0]['fechaNacimientoP2'];
                    me.escolaridad_idP2 =me.arrayProductorT[0]['escolaridad_idP2'];

                    me.NombreP3 = me.arrayProductorT[0]['NombreP3'];
                    me.parentesco3 =me.arrayProductorT[0]['parentesco3'];
                    me.ccP3 =me.arrayProductorT[0]['ccP3'];
                    me.fechaNacimientoP3 =me.arrayProductorT[0]['fechaNacimientoP3'];
                    me.escolaridad_idP3 =me.arrayProductorT[0]['escolaridad_idP3'];

                    me.NombreP4 = me.arrayProductorT[0]['NombreP4'];
                    me.parentesco4 =me.arrayProductorT[0]['parentesco4'];
                    me.ccP4 =me.arrayProductorT[0]['ccP4'];
                    me.fechaNacimientoP4 =me.arrayProductorT[0]['fechaNacimientoP4'];
                    me.escolaridad_idP4 =me.arrayProductorT[0]['escolaridad_idP4'];

                    me.NombreP5 = me.arrayProductorT[0]['NombreP5'];
                    me.parentesco5 =me.arrayProductorT[0]['parentesco5'];
                    me.ccP5 =me.arrayProductorT[0]['ccP5'];
                    me.fechaNacimientoP5 =me.arrayProductorT[0]['fechaNacimientoP5'];
                    me.escolaridad_idP5 =me.arrayProductorT[0]['escolaridad_idP5'];

                    me.listado=2;
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
