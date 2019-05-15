<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar | KPI DIRESA</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <!-- Bulma Version 0.7.2-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="{{ asset('public/css/login.css') }}">

    <script defer src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"></script>
</head>

<body>
  <section class="hero is-success is-fullheight">
      <div class="hero-body">
        <div class="container has-text-centered">
                    <div class="column is-4 is-offset-4">
                        <h3 class="title has-text-white">Registrarse</h3>
                        <p class="subtitle has-text-white">Complete el formulario.</p>
                        <div class="box">
                          <figure class="avatar">
                              <img src="{{asset('public/images/diresa.png')}}" width="128">
                          </figure>
                          <!-- <div class="card-header">{{ __('Registrarse') }}</div> -->

                            <form method="POST" action="{{ route('register') }}" aria-label="{{ __('Register') }}">
                                @csrf

                                <div class="field">
                                    <!-- <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Nombre') }}</label> -->

                                    <div class="col-md-6">
                                        <input id="name" type="text" class="input is-large form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" placeholder="Nombre completo" required autofocus>

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="field">
                                    <!-- <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('Correo') }}</label> -->

                                    <div class="col-md-6">
                                        <input id="email" type="email" class="input is-large form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required placeholder="Correo">

                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="field">
                                    <!-- <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Contraseña') }}</label> -->

                                    <div class="col-md-6">
                                        <input id="password" type="password" class="input is-large form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="Contraseña">

                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="field">
                                    <!-- <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirmar Contraseña') }}</label> -->

                                    <div class="col-md-6">
                                        <input id="password-confirm" type="password" class="input is-large form-control" name="password_confirmation" required placeholder="Confirmar Contraseña">
                                    </div>
                                </div>

                                <div class="field">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="button is-block is-info is-large is-fullwidth">
                                            {{ __('Registrar') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <p class="has-text-white">
                            <a href="{{ route('login') }}">{{ __('Iniciar Sesión') }}</a> &nbsp;·&nbsp;
                            <a href="{{ route('password.request') }}">¿Olvido su contraseña?</a> &nbsp;·&nbsp;
                            <a href="#">¿Necesitas ayuda?</a>
                        </p>
                    </div>
        </div>
      </div>
  </section>

</body>

</html>
