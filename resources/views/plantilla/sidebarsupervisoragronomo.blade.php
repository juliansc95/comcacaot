<div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title">
                        Supervisor Agronomo
                    </li>
                    <li class="nav-item nav-dropdown">
                        <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-wallet"></i> Productores</a>
                        <ul class="nav-dropdown-items">
                            <li @click="menu=16" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-wallet"></i> Registro Rapido</a>
                            </li>
                            <li @click="menu=6" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-wallet"></i> Componente social</a>
                            </li>
                            <li @click="menu=7" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-notebook"></i> Componente economico</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-dropdown">
                        <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-bag"></i>Fincas</a>
                        <ul class="nav-dropdown-items">
                            <li @click="menu=1" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-bag"></i> Registro Finca</a>
                            </li>
                            <li @click="menu=2" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-bag"></i> Area cultivo cacao</a>
                            </li>
                            <li @click="menu=3" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-bag"></i> Labores del Cultivo</a>
                            </li>
                            <li @click="menu=4" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-bag"></i> Cosecha produccion y beneficio de cacao</a>
                            </li>
                            <li @click="menu=5" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-bag"></i> Manejo ambiental de la finca</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-dropdown">
                        <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-pie-chart"></i> Visitas</a>
                        <ul class="nav-dropdown-items">
                            <li @click="menu=13" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-chart"></i>Linea Base</a>
                            </li>
                            <li @click="menu=14" class="nav-item">
                                <a class="nav-link" href="#"><i class="icon-chart"></i> Seguimiento</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </nav>
            <button class="sidebar-minimizer brand-minimizer" type="button"></button>
        </div>