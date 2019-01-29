<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="csrf-token" content="{{ csrf_token() }}">
      <title>KPI</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
      <!-- Bulma Version 0.7.2-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css" />
      <link rel="stylesheet" type="text/css" href="{{ asset('public/css/admin.css') }}">

      <script defer src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>

      @yield('custom-css')

  </head>

  <body>

    <script type="text/javascript">
    var base_url = "{{ URL::to('/') }}";
    </script>

    <!-- START NAV -->
    <nav class="navbar is-white">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item brand-text" href="{{ url('/') }}">
                  <img src="{{ asset('public/images/diresa2.png') }}">
                </a>
                <div class="navbar-burger burger" data-target="navMenu">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <div id="navMenu" class="navbar-menu">
                @guest
                <div class="navbar-end">
                  <div class="navbar-item">
                    <div class="field is-grouped">
                      <p class="control">
                        <a class="bd-tw-button button" href="{{ route('login') }}">
                          {{ __('Iniciar sesión') }}
                        </a>
                      </p>
                      <p class="control">
                        <a class="button is-primary" href="{{ route('register') }}">
                          {{ __('Registrarse') }}
                        </a>
                      </p>
                    </div>
                  </div>
                </div>
                @else
                <!-- <div class="navbar-start">
                    <a class="navbar-item" href="admin.html">
                      Inicio
                    </a>
                    <a class="navbar-item" href="admin.html">
                      Indicadores
                    </a>
                    <a class="navbar-item" href="admin.html">
                      Graficos
                    </a>
                    <a class="navbar-item" href="admin.html">
                      Ayuda
                    </a>
                </div> -->
                <div class="navbar-end">
                  <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                      {{ Auth::user()->name }}
                    </a>

                    <div class="navbar-dropdown is-boxed">

                      <a class="navbar-item" href="{{ url('changepassword') }}">
                        {{ __('Perfil') }}
                      </a>



                      <hr class="navbar-divider">
                      <a class="navbar-item" href="{{ route('logout') }}"
                         onclick="event.preventDefault();
                                       document.getElementById('logout-form').submit();">
                        {{ __('Salir') }}
                      </a>

                      <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                          @csrf
                      </form>
                    </div>
                  </div>
                </div>
                @endguest
            </div>
        </div>
    </nav>
    <!-- END NAV -->

    <div class="container">
        <div class="columns">

          <div class="column is-3" id="vm2">
              <aside class="menu is-hidden-mobile">
                  <p class="menu-label">
                      DIRESA APURIMAC
                  </p>
                  <ul class="menu-list">
                      <li>
                        <p class="menu-label">Programa Articulado Nutricional</p>
                        <ul>
                            <li><a href="#">Comparación con el padrón nominal regional</a></li>
                        </ul>
                      </li>
                  </ul>
                  <ul class="menu-list">
                      <li>
                          <p class="menu-label">Estrategias de Salud</p>
                          <ul>
                              <li><a :class="[ tab === 'saludnino' ? 'is-active' : '']" @click="tab='saludnino'" href="{{ url('atencion-integral-salud-nino') }}">Atención Integral de Salud del Niño</a></li>
                              <li><a :class="[ tab === 'profilaxis' ? 'is-active' : '']" href="{{ url('/indicadores/admin-profix-antiparasitaria') }}">Administración de Profilaxis Antiparasitaria</a></li>
                              <!-- <li><a :class="[ tab === 'morbilidad' ? 'is-active' : '']" @click="tab='morbilidad'" href="{{ url('#') }}">Programa Etapa Vida Niño</a></li> -->
                              <li><a :class="[ tab === 'morbilidad' ? 'is-active' : '']" href="{{ url('/morbilidad') }}">Morbilidad por Consulta Externa</a></li>
                              <li><a :class="[ tab === 'ocular' ? 'is-active' : '']" @click="tab='ocular'" href="{{ url('/ocular') }}">Salud Ocular</a></li>
                              <li><a :class="[ tab === 'cancer' ? 'is-active' : '']" @click="tab='cancer'" href="{{ url('#') }}">Estrategia Cáncer</a></li>
                          </ul>
                      </li>
                  </ul>
                  <ul class="menu-list">
                      <li>
                          <p class="menu-label">Padrón Nominal Regional</p>
                          <ul>
                              <li><a href="{{ url('#') }}">Detalle de seguimiento y monitoreo del registro de padrón nominal</a></li>
                              <li>
                                <a href="{{ url('/indicadores/permanencia-personal') }}">Permanencia Personal</a>
                              </li>
                          </ul>
                      </li>
                  </ul>

                  <p class="menu-label">
                      Configuración
                  </p>
                  <ul class="menu-list">
                      <li><a href="{{ url('changepassword') }}">Perfil</a></li>
                      <li><a href="{{ url('changepassword') }}">Seguridad</a></li>
                  </ul>
              </aside>
          </div>

          @yield('content')

        </div>
    </div>

    <script async type="text/javascript" src="{{ asset('public/js/bulma.js') }}"></script>

    @yield('custom-js')

    <!-- <script async type="text/javascript" src="{{ asset('public/js/navmenu.js') }}"></script> -->
    <!-- <script src="../node_modules/bulma-calendar/dist/js/bulma-calendar.min.js"></script> -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->

  </body>
</html>
