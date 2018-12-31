@extends('layouts.app')

@section('content')
<section class="hero is-info welcome is-small">
    <div class="hero-body">
        <div class="container">
            <h1 class="title">
                Administración de Profilaxis Antiparasitaria
            </h1>
            <h2 class="subtitle">
                Indicadores
            </h2>
        </div>
    </div>
</section>
<br>
<div class="box">
  <article class="media">
    <div class="media-left">
      <figure class="image is-128x128">
        <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
      </figure>
    </div>
    <div class="media-content">
      <div class="content">
        <p>
          <strong>John Smith</strong> <small>@johnsmith</small> <small>31m</small>
          <br>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis.
        </p>
      </div>
    </div>
  </article>
</div>

@endsection
