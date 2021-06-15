        @extends('principal')
        @section('contenido')

        @if(Auth::check())
            @if(Auth::user()->idrol == 1)
            <template v-if="menu==0">
               <dashboard></dashboard>
            </template>

            <template v-if="menu==1">
               <finca></finca>
            </template>

            <template v-if="menu==2">
                <cultivo></cultivo>
            </template>

            <template v-if="menu==3">
                <labor></labor>
            </template>
            
            <template v-if="menu==4">
               <cosechaproduccion></cosechaproduccion>
            </template>

            <template v-if="menu==5">
                <manejo></manejo>
            </template>

            <template v-if="menu==6">
            <productor></productor>
            </template>

            <template v-if="menu==7">
                <economico></economico>
            </template>

            <template v-if="menu==8">
                <venta></venta>
            </template>

            <template v-if="menu==9">
                <categoriamora></categoriamora>
            </template>

            <template v-if="menu==10">
               <lugarventa></lugarventa>
            </template>
            
            <template v-if="menu==11">
               <user></user>
            </template>

            <template v-if="menu==12">
               <rol></rol>
            </template>

            <template v-if="menu==13">
               <linea></linea>
            </template>

            <template v-if="menu==14">
               <visita></visita>
            </template>

          
            @elseif(Auth::user()->idrol == 2)
            <template v-if="menu==5">
                <ventatecnico></ventatecnico>
            </template>   
            @elseif(Auth::user()->idrol == 3)
            <template v-if="menu==1">
                <finca></finca>
            </template>
            <template v-if="menu==2">
                <cultivo></cultivo>
            </template>
            <template v-if="menu==3">
                <productor></productor>
            </template>
            
            <template v-if="menu==9">
                <predio></predio>
            </template>

            <template v-if="menu==10">
               <poda></poda>
            </template>
            
            <template v-if="menu==11">
               <plaga></plaga>
            </template>

            <template v-if="menu==12">
               <nutricion></nutricion>
            </template>

            <template v-if="menu==13">
               <tutorado></tutorado>
            </template>

            <template v-if="menu==14">
               <riego></riego>
            </template>

            <template v-if="menu==15">
               <practica></practica>
            </template>

            <template v-if="menu==16">
               <suelo></suelo>
            </template>

            <template v-if="menu==17">
               <vocacion></vocacion>
            </template>

            <template v-if="menu==18">
               <cosecha></cosecha>
            </template>

            <template v-if="menu==19">
               <visita></visita>
            </template>   
            <template v-if="menu==20">
               <gpx></gpx>
            </template>    
            @elseif(Auth::user()->idrol == 4)
            <template v-if="menu==1">
                <fincaproductor></fincaproductor>
            </template>

            <template v-if="menu==2">
                <cultivoproductor></cultivoproductor>
            </template>

            <template v-if="menu==3">
                <productorpro></productorpro>
            </template>

            <template v-if="menu==4">
                <encuestafitosanitaria></encuestafitosanitaria>
            </template>

            <template v-if="menu==5">
            <VentaProductor></VentaProductor>
            </template>
            @elseif(Auth::user()->idrol == 5)
            <template v-if="menu==5">
            <ventacontador></ventacontador>
            </template>
            @else
            @endif
        @endif
    @endsection