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
              <h1>Pendiente</h1>
            </template>

          
            @elseif(Auth::user()->idrol == 2)
            
            @elseif(Auth::user()->idrol == 3)
         
            @elseif(Auth::user()->idrol == 4)
            
            @elseif(Auth::user()->idrol == 5)

            @else
            @endif
        @endif
    @endsection