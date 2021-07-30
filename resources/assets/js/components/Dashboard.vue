<template>
<main class="main">
    <!-- Breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Escritorio</a></li>
    </ol>
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">
                
            </div>
            <div class="car-body">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Usuarios</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="ingresos">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Usuarios registrados por dia</p>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Ventas</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="ventas">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Ventas de los últimos dias.</p>
                            </div>
                        </div>
                    </div>
                    </div>
                      <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Estado Civil</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="estadoCivil">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de estado civil de los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Etnias</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="etnia">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de etnias de los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Sexos</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="sexo">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion por sexo de los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Edades</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="edad">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion por rango de edad de los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Escolaridad</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="escolaridad">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion por grado de escolaridad de los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Discapacitados</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="discapacitado">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo si el productor tiene discapacidad o no</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Personas a cargo de los productores</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="personaAcargo">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo al numero de personas a cargo de cada productor</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Productores en condiciones de desplazamiento </h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="desplazado">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo al numero de productores en condicion de desplazamiento y no desplazamiento</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Creditos </h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="credito">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo a los bancos que tienen los productores sus respectivos creditos</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Variedad Arboles </h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="variedad">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo a la variedad de arboles con que cuentan los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Variedad Arboles con injerto</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="injerto">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo a la variedad de arboles con injerto con que cuentan los productores</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Control</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="control">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo a los productores que realizan control en su cultivo</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Metodo</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="metodo">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo a los mecanismos de control que usan los productores en su cultivo</p>
                            </div>
                        </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Drenaje</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="drenaje">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo al tipo de drenaje que usan los productores en su cultivo</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Cosecha</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="cosecha">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion entre la cosecha fresca y seca total del mes los productores en Kg</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Componente Economico Productor</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="economico">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Diagrama de lineas entre ingreso mensual,otros ingresos, ingresos netos y gasto mensual de todos los productores.</p>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-1"></div>    
                    <div class="col-md-10">
                        <div class="card card-chart">
                            <div class="card-header">
                                <h4>Fincas por vereda</h4>
                            </div>
                            <div class="card-content">
                                <div class="ct-chart">
                                    <canvas id="finca">                                                
                                    </canvas>
                                </div>
                            </div>
                            <div class="card-footer">
                                <p>Distribucion de acuerdo al numero de fincas por vereda</p>
                            </div>
                        </div>
                    </div>
                    </div>
            </div>
        </div>
    </div>

</main>
</template>
<script>
    export default{
        data(){
            return{
                varIngreso:null,
                charIngreso:null,
                ingresos:[],
                varTotalIngreso:[],
                varMesIngreso:[], 

                varVenta:null,
                charVenta:null,
                ventas:[],
                varTotalVenta:[],
                varMesVenta:[],

                varEstado:null,
                charEstado:null,
                estadoCivils:[],
                varTotalEstados:[],
                varEstados:[],

                varEtnia:null,
                charEtnia:null,
                etnias:[],
                varTotalEtnias:[],
                varEtnias:[],

                varSexo:null,
                charSexo:null,
                sexos:[],
                varTotalSexos:[],
                varSexos:[],

                varEdad:null,
                charEdad:null,
                edades:[],
                varTotalEdades:[],
                varEdades:[],

                varEscolaridad:null,
                charEscolaridad:null,
                escolaridades:[],
                varTotalEscolaridades:[],
                varEsolaridades:[],

                varDiscapacitado:null,
                charDiscapacitado:null,
                discapacitados:[],
                varTotalDiscapacitados:[],
                varDiscapacitados:[],

                varPersonaAcargo:null,
                charPersonaAcargo:null,
                personasAcargo:[],
                varTotalPersonasAcargo:[],
                varPersonasAcargo:[],

                varDesplazado:null,
                charDesplazado:null,
                desplazados:[],
                varTotalDesplazados:[],
                varDesplazados:[],

                varCredito:null,
                charCredito:null,
                creditos:[],
                varTotalCreditos:[],
                varCreditos:[],

                varVariedadCultivo:null,
                charVariedadCultivo:null,
                variedades:[],
                varTotalVariedad:[],
                varVariedades:["Criollo","CCN51","ICS95","Otros"],

                varInjertoCultivo:null,
                charInjertoCultivo:null,
                injertos:[],
                varTotalInjerto:[],
                varVariedades:["Criollo","CCN51","ICS95","Otros"],

                varControl:null,
                charControl:null,
                controles:[],
                varTotalControles:[],
                varControles:[],

                varMetodo:null,
                charMetodo:null,
                metodos:[],
                varTotalMetodos:[],
                varMetodos:[],

                varDrenaje:null,
                charDrenaje:null,
                drenajes:[],
                varTotalDrenajes:[],
                varDrenajes:[],

                varCosecha:null,
                charCosecha:null,
                cosechas:[],
                varTotalCosechas:[],
                varCosechas:["Fresco","Seco"],

                varEconomico:null,
                charEconomico:null,
                prueba:null,
                economicos:[],
                varTotalMensuales:[],
                varTotalGastos:[],
                varTotalOtros:[],
                varTotalNeto:[],
                varMensuales:["Total"],

                varFinca:null,
                charFinca:null,
                fincas:[],
                varTotalFincas:[],
                varFincas:[],               
            }
        },
        methods: {
            getIngresos(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.ingresos = respuesta.usuarios;
                    //cargamos los datos del chart
                    me.loadIngresos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getVentas(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.ventas = respuesta.ventas;
                    //cargamos los datos del chart
                    me.loadVentas();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getEstadoCivil(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.estadoCivils = respuesta.estadoCivil;
                    //cargamos los datos del chart
                    me.loadEstados();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             getEtnias(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.etnias = respuesta.etnias;
                    //cargamos los datos del chart
                    me.loadEtnias();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getSexos(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.sexos = respuesta.sexos;
                    //cargamos los datos del chart
                    me.loadSexos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getEdades(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.edades = respuesta.edades;
                    //cargamos los datos del chart
                    me.loadEdades();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getEscolaridades(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.escolaridades = respuesta.escolaridades;
                    //cargamos los datos del chart
                    me.loadEscolaridades();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
             getDiscapacitados(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.discapacitados = respuesta.discapacitados;
                    //cargamos los datos del chart
                    me.loadDiscapacitados();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getPersonasAcargo(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.personasAcargo = respuesta.personasacargo;
                    //cargamos los datos del chart
                    me.loadPersonasAcargo();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getDesplazados(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.desplazados = respuesta.desplazados;
                    //cargamos los datos del chart
                    me.loadDesplazados();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getCreditos(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.creditos = respuesta.creditos;
                    //cargamos los datos del chart
                    me.loadCreditos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getVariedades(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.variedades = respuesta.variedades;
                    //cargamos los datos del chart
                    me.loadVariedades();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getInjertos(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.injertos = respuesta.variedadesinjertado;
                    //cargamos los datos del chart
                    me.loadInjertos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getControles(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.controles = respuesta.control;
                    //cargamos los datos del chart
                    me.loadControles();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getMetodos(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.metodos = respuesta.metodo;
                    //cargamos los datos del chart
                    me.loadMetodos();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getDrenajes(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.drenajes = respuesta.drenaje;
                    //cargamos los datos del chart
                    me.loadDrenajes();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getCosechas(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.cosechas = respuesta.cosecha;
                    //cargamos los datos del chart
                    me.loadCosechas();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getEconomico(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.economicos = respuesta.economico;
                    //cargamos los datos del chart
                    me.loadEconomico();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            getFinca(){
                let me=this;
                var url= 'dashboard';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.fincas = respuesta.finca;
                    //cargamos los datos del chart
                    me.loadFinca();
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            loadIngresos(){
                let me=this;
                me.ingresos.map(function(x){
                    me.varMesIngreso.push(x.mes);
                    me.varTotalIngreso.push(x.total);
                });
                me.varIngreso=document.getElementById('ingresos').getContext('2d');

                me.charIngreso = new Chart(me.varIngreso, {
                    type: 'bar',
                    data: {
                        labels: me.varMesIngreso,
                        datasets: [{
                            label: 'Usuarios',
                            data: me.varTotalIngreso,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 0.2)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
            },
            loadVentas(){
                let me=this;
                me.ventas.map(function(x){
                    me.varMesVenta.push(x.mes);
                    me.varTotalVenta.push(x.total);
                });
                me.varVenta=document.getElementById('ventas').getContext('2d');

                me.charVenta = new Chart(me.varVenta, {
                    type: 'bar',
                    data: {
                        labels: me.varMesVenta,
                        datasets: [{
                            label: 'Ventas',
                            data: me.varTotalVenta,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 0.2)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });
            },
            loadEstados(){
                let me=this;
                me.estadoCivils.map(function(x){
                    me.varEstados.push(x.estadocivil_nombre);
                    me.varTotalEstados.push(x.total);
                });
                me.varEstado=document.getElementById('estadoCivil').getContext('2d');

                me.charEstado = new Chart(me.varEstado, {
                    type: 'pie',
                    data: {
                        labels: me.varEstados,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalEstados,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadEtnias(){
                let me=this;
                me.etnias.map(function(x){
                    me.varEtnias.push(x.nombre_etnia);
                    me.varTotalEtnias.push(x.total);
                });
                me.varEtnia=document.getElementById('etnia').getContext('2d');

                me.charEtnia = new Chart(me.varEtnia, {
                    type: 'pie',
                    data: {
                        labels: me.varEtnias,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalEtnias,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadSexos(){
                let me=this;
                me.sexos.map(function(x){
                    me.varSexos.push(x.nombre_sexo);
                    me.varTotalSexos.push(x.total);
                });
                me.varSexo=document.getElementById('sexo').getContext('2d');

                me.charSexo = new Chart(me.varSexo, {
                    type: 'pie',
                    data: {
                        labels: me.varSexos,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalSexos,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadEdades(){
                let me=this;
                me.edades.map(function(x){
                    me.varEdades.push(x.rango);
                    me.varTotalEdades.push(x.total);
                });
                me.varEdad=document.getElementById('edad').getContext('2d');

                me.charEdad = new Chart(me.varEdad, {
                    type: 'pie',
                    data: {
                        labels: me.varEdades,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalEdades,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadEscolaridades(){
                let me=this;
                me.escolaridades.map(function(x){
                    me.varEsolaridades.push(x.nombre_escolaridad);
                    me.varTotalEscolaridades.push(x.total);
                });
                me.varEscolaridad=document.getElementById('escolaridad').getContext('2d');

                me.charEscolaridad = new Chart(me.varEscolaridad, {
                    type: 'pie',
                    data: {
                        labels: me.varEsolaridades,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalEscolaridades,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadDiscapacitados(){
                let me=this;
                me.discapacitados.map(function(x){
                    me.varDiscapacitados.push(x.opcion_discapacitado);
                    me.varTotalDiscapacitados.push(x.total);
                });
                me.varDiscapacitado=document.getElementById('discapacitado').getContext('2d');

                me.charDiscapacitado = new Chart(me.varDiscapacitado, {
                    type: 'pie',
                    data: {
                        labels: me.varDiscapacitados,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalDiscapacitados,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadPersonasAcargo(){
                let me=this;
                me.personasAcargo.map(function(x){
                    me.varPersonasAcargo.push(x.personasAcargo);
                    me.varTotalPersonasAcargo.push(x.total);
                });
                me.varPersonaAcargo=document.getElementById('personaAcargo').getContext('2d');

                me.charPersonaAcargo = new Chart(me.varPersonaAcargo, {
                    type: 'pie',
                    data: {
                        labels: me.varPersonasAcargo,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalPersonasAcargo,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadDesplazados(){
                let me=this;
                me.desplazados.map(function(x){
                    me.varDesplazados.push(x.opcion_desplazado);
                    me.varTotalDesplazados.push(x.total);
                });
                me.varDesplazado=document.getElementById('desplazado').getContext('2d');

                me.charDesplazado = new Chart(me.varDesplazado, {
                    type: 'pie',
                    data: {
                        labels: me.varDesplazados,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalDesplazados,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadCreditos(){
                let me=this;
                me.creditos.map(function(x){
                    me.varCreditos.push(x.nombre_banco);
                    me.varTotalCreditos.push(x.total);
                });
                me.varCredito=document.getElementById('credito').getContext('2d');

                me.charCredito = new Chart(me.varCredito, {
                    type: 'pie',
                    data: {
                        labels: me.varCreditos,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalCreditos,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadVariedades(){
                let me=this;
                me.variedades.map(function(x){
                    me.varTotalVariedad.push(x.criollo,x.CCN51,x.ICS95,x.otros);
                });
                me.varVariedadCultivo=document.getElementById('variedad').getContext('2d');

                me.charVariedadCultivo = new Chart(me.varVariedadCultivo, {
                    type: 'pie',
                    data: {
                        labels: me.varVariedades,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalVariedad,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadInjertos(){
                let me=this;
                me.injertos.map(function(x){
                    me.varTotalInjerto.push(x.criollo,x.CCN51,x.ICS95,x.otros);
                });
                me.varInjertoCultivo=document.getElementById('injerto').getContext('2d');

                me.charInjertoCultivo = new Chart(me.varInjertoCultivo, {
                    type: 'pie',
                    data: {
                        labels: me.varVariedades,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalInjerto,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadControles(){
                let me=this;
                me.controles.map(function(x){
                    me.varControles.push(x.opcion_control);
                    me.varTotalControles.push(x.total);
                });
                me.varControl=document.getElementById('control').getContext('2d');

                me.charControl = new Chart(me.varControl, {
                    type: 'pie',
                    data: {
                        labels: me.varControles,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalControles,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadMetodos(){
                let me=this;
                me.metodos.map(function(x){
                    me.varMetodos.push(x.metodo);
                    me.varTotalMetodos.push(x.total);
                });
                me.varMetodo=document.getElementById('metodo').getContext('2d');

                me.charMetodo = new Chart(me.varMetodo, {
                    type: 'pie',
                    data: {
                        labels: me.varMetodos,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalMetodos,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadDrenajes(){
                let me=this;
                me.drenajes.map(function(x){
                    me.varDrenajes.push(x.drenaje);
                    me.varTotalDrenajes.push(x.total);
                });
                me.varDrenaje=document.getElementById('drenaje').getContext('2d');

                me.charDrenaje = new Chart(me.varDrenaje, {
                    type: 'pie',
                    data: {
                        labels: me.varDrenajes,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalDrenajes,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadCosechas(){
                let me=this;
                me.cosechas.map(function(x){
                    me.varTotalCosechas.push(x.fresco,x.seco);
                });
                me.varCosecha=document.getElementById('cosecha').getContext('2d');

                me.charCosecha = new Chart(me.varCosecha, {
                    type: 'pie',
                    data: {
                        labels: me.varCosechas,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalCosechas,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },
            loadEconomico(){
                let me=this;
                me.economicos.map(function(x){
                me.varTotalMensuales.push(x.ingresoMensual);
                me.varTotalGastos.push(x.gastoMensual);
                me.varTotalOtros.push(x.otrosIngresos);
                me.varTotalNeto.push(x.ingresoNeto);
                });
                me.varEconomico=document.getElementById('economico').getContext('2d');
                var gastos = {
                label: "Gastos Mensuales($)",
                data: me.varTotalGastos,
                backgroundColor: 'rgba(211,93,110, 0.2)',// Color de fondo
                borderColor: 'rgba(211,93,110, 1)',// Color del borde
                borderWidth: 1,// Ancho del borde
                };
                var ingresos = {
                label: "Ingresos Mensuales($)",
                data: me.varTotalMensuales,
                backgroundColor: 'rgba(54, 162, 235, 0.2)', // Color de fondo
                borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
                borderWidth: 1,// Ancho del borde
                 };
                var otrosIngresos = {
                label: "Otros ingresos Mensuales($)",
                data: me.varTotalOtros,
                backgroundColor: 'rgba(209,234,163,0.5)',// Color de fondo
                borderColor: 'rgba(209,234,163,1)',// Color del borde
                borderWidth: 1,// Ancho del borde
                }; 
                var ingresoNeto = {
                label: "Ingresos netos Mensuales($)",
                data: me.varTotalNeto,
                backgroundColor: 'rgba(255, 159, 64, 0.2)',// Color de fondo
                borderColor: 'rgba(255, 159, 64, 1)',// Color del borde
                borderWidth: 1,// Ancho del borde
                }; 
                var grafico = {
                datasets: [gastos, ingresos,otrosIngresos,ingresoNeto]
                };
                me.charEconomico = new Chart(me.varEconomico, {
                    type: 'line',
                    data:grafico,
                });
            },
            loadFinca(){
                let me=this;
                me.fincas.map(function(x){
                     me.varFincas.push(x.nombre_vereda);
                    me.varTotalFincas.push(x.total);
                });
                me.varFinca=document.getElementById('finca').getContext('2d');

                me.charFinca = new Chart(me.varFinca, {
                    type: 'bar',
                    data: {
                        labels: me.varFincas,
                        datasets: [{
                            label: 'Total',
                            data: me.varTotalFincas,
                            backgroundColor: ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderColor:  ["rgba(54, 162, 235, 0.2)","rgba(255, 99, 132, 0.2)","rgba(208, 255, 181, 1)","rgba(249, 250, 121, 1)","rgba(255, 182, 128, 1)",
                            "rgba(255, 85, 59, 1)","rgba(204, 59, 255, 1)","rgba(10, 16, 180, 1)","rgba(10, 180, 150, 1)"],
                            borderWidth: 1
                        }]
                    },
                   
                });
            },

        },
        mounted() {
            this.getVentas();
            this.getIngresos();
            this.getEstadoCivil();
            this.getEtnias();
            this.getSexos();
            this.getEdades();
            this.getEscolaridades();
            this.getDiscapacitados();
            this.getPersonasAcargo();
            this.getDesplazados();
            this.getCreditos();
            this.getVariedades();
            this.getInjertos();
            this.getControles();
            this.getMetodos();
            this.getDrenajes();
            this.getCosechas();
            this.getEconomico();
            this.getFinca();
        },
    }
</script>
    