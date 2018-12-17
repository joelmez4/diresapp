<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
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
    var base_url = "{{ URL::to('/') }}"
    </script>
    <!-- START NAV -->
    <nav class="navbar is-white">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item brand-text" href="{{ url('/') }}">
                  <b>KPI | DIRESA</b>
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
                <div class="navbar-start">
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
                </div>
                <div class="navbar-end">
                  <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                      {{ Auth::user()->name }}
                    </a>

                    <div class="navbar-dropdown is-boxed">
                      <a class="navbar-item" href="{{ route('logout') }}"
                         onclick="event.preventDefault();
                                       document.getElementById('logout-form').submit();">
                        {{ __('Salir') }}
                      </a>

                      <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                          @csrf
                      </form>

                      <hr class="navbar-divider">
                      <div class="navbar-item">
                        Version 0.7.1
                      </div>
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

          <div class="column is-3 ">
              <aside class="menu is-hidden-mobile">
                  <p class="menu-label">
                      General
                  </p>
                  <ul class="menu-list">
                      <li><a class="is-active" href="{{ url('/') }}">Dashboard</a></li>
                  </ul>
                  <p class="menu-label">
                      Administración
                  </p>
                  <ul class="menu-list">
                      <li>
                          <a href="{{ url('atencion-integral-salud-nino') }}">ATENCIÓN INTEGRAL DE SALUD DEL NIÑO</a>
                          <ul>
                              <li><a>Indicadores</a></li>
                              <li><a>Metas</a></li>
                          </ul>
                      </li>
                      <li><a>Team Settings</a></li>
                      <li><a>Invitations</a></li>
                      <li><a>Authentication</a></li>
                  </ul>
                  <p class="menu-label">
                      Configuración
                  </p>
                  <ul class="menu-list">
                      <li><a>Perfil</a></li>
                      <li><a>Seguridad</a></li>
                  </ul>
              </aside>
          </div>

          <div class="column is-9" id="app">
            @yield('content')
          </div>

        </div>
    </div>

    <script async type="text/javascript" src="{{ asset('public/js/bulma.js') }}"></script>
    @yield('custom-js')

    <!-- <script src="../node_modules/bulma-calendar/dist/js/bulma-calendar.min.js"></script> -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>

    <script src="{{ url('/public/js/app.js') }}"></script>

  </body>
</html>
