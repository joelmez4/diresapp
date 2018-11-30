<h1 class="title">
  DIRESA
</h1>
<p class="subtitle">ATENCIÓN DEL RECIÉN NACIDO</p>

<div id="app">

<form id="form-recien-nacido" v-on:submit.prevent="processForm">

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">
      Seleccionar por Redes:
      <input type="radio" id="one" name="picked" value="one" v-model="picked" v-on:change="selectQuery">
    </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select v-model="selectedRed" v-on:change="microRedes" v-bind:disabled="cmbRedes">
              <option value="" selected>Todas las Redes</option>
              <option v-for="red in redes" v-bind:value="red.cod_red">@{{red.desc_red}}</option>
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
          <select v-model="selectedMred" v-bind:disabled="cmbMredes">
              <option value="" selected>Todas las Micro Redes</option>
              <option v-for="mred in mredes" v-bind:value="mred.cod_mic">@{{mred.desc_micro}}</option>
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
    <label class="label">
      Seleccionar por Provincias:
      <input type="radio" id="two" name="picked" value="two" v-model="picked" v-on:change="selectQuery">
    </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select v-model="selectedProvincia" v-on:change="distrito" v-bind:disabled="cmbProvincias">
              <option value="" selected>Todas las Provincias</option>
              <option v-for="provincia in provincias" v-bind:value="provincia.cod_prov">@{{provincia.desc_prov}}</option>
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
          <select v-model="selectedDistrito" v-bind:disabled="cmbDistritos">
            <option value="" selected>Todos los Distritos</option>
            <option v-for="distrito in distritos" v-bind:value="distrito.cod_dist" v-text="distrito.desc_dist"></option>
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
        <input class="input" name="startDate" v-model="startDate" type="date" placeholder="Fecha Inicio" required>
        <span class="icon is-small is-left">
          <i class="far fa-calendar-alt"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control is-expanded has-icons-left has-icons-right">
        <input class="input" name="endDate" v-model="endDate" type="date" placeholder="Fecha Fin" required>
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
        <button class="button is-primary" type="submit" v-on:click="">
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
