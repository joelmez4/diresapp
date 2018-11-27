<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'DIRESA') }}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
    @yield('custom-css')
  </head>
  <body>
    <nav class="navbar is-primary">
      <div class="navbar-brand">
        <a class="navbar-item" href="{{ url('/') }}">
          <img src="{{ url('/storage/logo-diresa.png') }}" alt="Bulma: a modern CSS framework based on Flexbox" width="112" height="28">
        </a>
        <div class="navbar-burger burger" data-target="navbarExampleTransparentExample">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>

      <div id="navbarExampleTransparentExample" class="navbar-menu">
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
          <a class="navbar-item" href="{{ url('/') }}">
            Inicio
          </a>
          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              ATENCIÓN INTEGRAL DE SALUD DEL NIÑO
            </a>
            <div class="navbar-dropdown is-boxed">
              <a class="navbar-item" href="AtencionIntegralSaludNino">
                 I. ATENCIÓN DEL RECIÉN NACIDO
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 II. CONTROL DE CRECIMIENTO Y DESARROLLO
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 III. TAMIZAJE
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 IV. ADMINISTRACIÓN DE PROFILAXIS ANTIPARASITARIA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 V. ADMINISTRACION DE MICRONUTRIENTES
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 VI. LACTANCIA MATERNA EXCLUSIVA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 IV. ADMINISTRACIÓN DE PROFILAXIS ANTIPARASITARIA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 VII. ALIMENTACIÓN COMPLEMENTARIA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 VIII. EVALUACION DEL ESTADO NUTRICIONAL
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 IX. EVALUACION DEL DESARROLLO
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 X. PLAN DE ATENCION INTEGRAL
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XI. CONSEJERÍA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XII. VISITA DOMICILIARIA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XIII. ESTIMULACION TEMPRANA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XIV. ACTIVIDADES EXTRAMURALES, MASIVAS Y DE GESTIÓN
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XV.  ATENCION DE LAS ENFERMEDADES PREVALENTES DE LA INFANCIA
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XVI. DEFUNCIONES
              </a>
              <a class="navbar-item" href="/documentation/overview/start/">
                 XVI. VIGILANCIA DEL CONSUMO DE SAL YODADA
              </a>
              <hr class="navbar-divider">
              <a class="navbar-item" href="#">
                Info
              </a>
            </div>
          </div>
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
          <a class="navbar-item" href="#">

          </a>
          <a class="navbar-item" href="#">

          </a>
        </div>
        @endguest
      </div>
    </nav>

    <main>
        @yield('content')
    </main>
        @yield('custom-js')
  </body>
</html>
