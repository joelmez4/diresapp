<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ingresar | KPI DIRESA</title>
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
                    <h3 class="title has-text-white">Iniciar sesión</h3>
                    <p class="subtitle has-text-white">Por favor, inicie sesión para continuar.</p>
                    <div class="box">
                        <figure class="avatar">
                            <img src="{{url('/storage/app/public/diresa.png')}}" width="128">
                        </figure>
                        <form method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
                            @csrf

                            <div class="field">
                              <p class="control has-icons-left has-icons-right">
                                <input id="email" type="email" class="input is-large form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus placeholder="Email">
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                                <span class="icon is-small is-left">
                                  <i class="fas fa-envelope"></i>
                                </span>
                                <span class="icon is-small is-right">
                                  <i class="fas fa-check"></i>
                                </span>
                              </p>
                            </div>
                            <div class="field">
                              <p class="control has-icons-left">
                                <input id="password" type="password" class="input is-large form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="Password">
                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                                <span class="icon is-small is-left">
                                  <i class="fas fa-lock"></i>
                                </span>
                              </p>
                            </div>
                            <div class="field">
                              <input class="checkbox" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                              <label class="form-check-label" for="remember">
                                  {{ __('Recuérdame') }}
                              </label>
                            </div>
                            <div class="field">
                              <p class="control">
                                <button type="submit" class="button is-block is-info is-large is-fullwidth">
                                  Iniciar
                                </button>
                              </p>
                            </div>

                        </form>
                    </div>
                    <p class="has-text-white">
                        <a href="{{ route('register') }}">{{ __('Registrarse') }}</a> &nbsp;·&nbsp;
                        <a href="{{ route('password.request') }}">¿Olvido su contraseña?</a> &nbsp;·&nbsp;
                        <a href="#">¿Necesitas ayuda?</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!-- <script async type="text/javascript" src="{{ asset('public/js/bulma.js') }}"></script> -->
</body>

</html>
