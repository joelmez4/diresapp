<h1 class="title">
  DIRESA
</h1>
<p class="subtitle">ATENCIÓN DEL RECIÉN NACIDO</p>

<form id="form-recien-nacido" method="GET" action="getRecienNacido">

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Seleccionar por Redes: </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select id="cmb_red" name="txtRed">
              <option value="" selected>Todas las Redes</option>
            @foreach ($red as $red)
              <option value="{{ $red->cod_red }}">{{ $red->desc_red }}</option>
            @endforeach
          </select>
        </span>
        <span class="icon is-small is-left">
          <i class="fas fa-globe"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select id="cmb_mred" name="txtMred">
              <option value="" selected>Todas las Micro Redes</option>
          </select>
        </span>
        <span class="icon is-small is-left">
          <i class="fas fa-globe"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">Seleccionar por Provincias: </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select id="cmb_provincia" name="txtProvincia">
              <option value="" selected>Todas las Provincias</option>
            @foreach ($provincias as $provincia)
              <option value="{{ $provincia->cod_prov }}">{{ $provincia->desc_prov }}</option>
            @endforeach
          </select>
        </span>
        <span class="icon is-small is-left">
          <i class="fas fa-globe"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select id="cmb_distrito" name="txtDistrito">
            <option value="" selected>Todas las Provincias</option>
          </select>
        </span>
        <span class="icon is-small is-left">
          <i class="fas fa-globe"></i>
        </span>
      </p>
    </div>

  </div>
</div>

<div class="field is-horizontal">
  <!-- <div class="field-label"></div> -->
  <div class="field-label is-normal">
    <label class="label">Periodo: </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <input class="input" name="startDate" type="date" placeholder="Fecha Inicio" required>
        <span class="icon is-small is-left">
          <i class="far fa-calendar-alt"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control is-expanded has-icons-left has-icons-right">
        <input class="input" name="endDate" type="date" placeholder="Fecha Fin" required>
        <span class="icon is-small is-left">
          <i class="far fa-calendar-alt"></i>
        </span>
      </p>
    </div>
  </div>
</div>

<div class="field is-horizontal">
  <div class="field-label">
    <!-- Left empty for spacing -->
  </div>
  <div class="field-body">
    <div class="field">
      <div class="control">
        <button class="button is-primary" type="submit">
          <span>Buscar</span>
          <span class="icon">
            <i class="fas fa-search"></i>
          </span>
        </button>
        <a class="button is-danger" href="atencionRecienNacido/exportarpdf">
          <span>Exportar</span>
          <span class="icon">
            <i class="fas fa-file-pdf"></i>
          </span>
        </a>
      </div>
    </div>
  </div>
</div>

</form>
