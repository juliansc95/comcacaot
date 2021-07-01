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

        },
        mounted() {
            this.getVentas();
            this.getIngresos();
            this.getEstadoCivil();
            this.getEtnias();
            this.getSexos();
            this.getEdades();
            this.getDiscapacitados();
            this.getPersonasAcargo();
            this.getDesplazados();
        
        },
    }
</script>
    