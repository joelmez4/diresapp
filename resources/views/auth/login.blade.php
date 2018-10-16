@extends('layouts.app')

@section('content')
    <section class="hero">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">Iniciar sesión</h3>
                    <div class="box">
                        <figure class="avatar">
                            <img src="https://placehold.it/128x128">
                        </figure>
                        <form method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
                            @csrf

                            <div class="field">
                              <p class="control has-icons-left has-icons-right">
                                <input id="email" type="email" class="input form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus placeholder="Email">
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
                                <input id="password" type="password" class="input form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="Password">
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
                                  {{ __('Remember Me') }}
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
                    <p class="has-text-grey">
                        <a href="../">Sign Up</a> &nbsp;·&nbsp;
                        <a href="{{ route('password.request') }}">Forgot Password</a> &nbsp;·&nbsp;
                        <a href="../">Need Help?</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
@endsection
