@extends('layouts.app')

@section('custom-css')

<style media="screen">
.resp-container {
    position: relative;
    overflow: hidden;
    padding-top: 56.25%;
}
.resp-iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 0;
}
</style>

@endsection

@section('content')

<div class="column is-9" id="appRepositorio">
  <section class="hero is-info welcome is-small">
      <div class="hero-body">
          <div class="container">
              <h1 class="title">
                  Repositorio
              </h1>
              <h2 class="subtitle">
                  Administrador de archivos
              </h2>
          </div>
      </div>
  </section>
  <br>


  <div class="resp-container">
    <iframe class="resp-iframe" src="http://localhost/repo/elfinder.html" gesture="media"  allow="encrypted-media" allowfullscreen></iframe>
  </div>

</div>
@endsection


@section('custom-js')

<script src="{{ url('/node_modules/axios/dist/axios.min.js') }}"></script>
<script src="{{ url('/node_modules/vue/dist/vue.min.js') }}"></script>
<script src="{{ asset('/public/js/repositorio/appRepositorio.js') }}"></script>

@endsection
