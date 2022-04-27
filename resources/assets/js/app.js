
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue';
import vSelect from 'vue-select';
import Datepicker from 'vuejs-datepicker';
import * as VueGoogleMaps from 'vue2-google-maps'
 



/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('productor', require('./components/ComponenteSocialProductor.vue'));
Vue.component('registro', require('./components/Registro.vue'));
Vue.component('rol', require('./components/Rol.vue'));
Vue.component('user', require('./components/User.vue'));
Vue.component('finca', require('./components/Finca.vue'));
Vue.component('cultivo', require('./components/Cultivo.vue'));
Vue.component('labor',require('./components/LaborCultivo.vue'));
Vue.component('linea',require('./components/LineaBase.vue'));
Vue.component('cosechaproduccion',require('./components/CosechaProduccion.vue'));
Vue.component('manejo',require('./components/ManejoAmbiental.vue'));
Vue.component('economico',require('./components/ProductorEconomico.vue'));
Vue.component('categoriamora', require('./components/categoriaMora.vue'));
Vue.component('v-select', vSelect);
Vue.component('v-datepicker', Datepicker);
Vue.component('venta', require('./components/Venta.vue'));
Vue.component('ventavendedor', require('./components/VentaVendedor.vue'));
Vue.component('lugarventa', require('./components/LugarVenta.vue'));
Vue.component('dashboard', require('./components/Dashboard.vue'));
Vue.component('backup', require('./components/Backup.vue'));
Vue.component('seguimiento', require('./components/Seguimiento.vue'));


const app = new Vue({
    el: '#app',
    data:{
        menu:0
    }
});

