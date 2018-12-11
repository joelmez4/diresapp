<!-- <h1 class="title">
  DIRESA
</h1>
<p class="subtitle">ATENCIÓN DEL RECIÉN NACIDO</p>

<div id="app"> -->

<form id="form-recien-nacido" v-on:submit.prevent="processForm">

<div class="field is-horizontal">
  <div class="field-label is-normal">
    <label class="label">
      Redes:
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
      Provincias:
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
  <!-- <div class="field-label"></div> -->
  <div class="field-label is-normal">
    <label class="label">Seleccionar: </label>
  </div>
  <div class="field-body">
    <div class="field">
      <p class="control is-expanded has-icons-left">
        <span class="select is-fullwidth">
          <select v-model="selectedAtencionRN">
              <option value="1">I. ATENCIÓN DEL RECIÉN NACIDO</option>
              <option value="2">II. CONTROL DE CRECIMIENTO Y DESARROLLO</option>
              <option value="3">III. TAMIZAJE</option>
              <option value="4">IV. ADMINISTRACIÓN DE PROFILAXIS ANTIPARASITARIA</option>
              <option value="5">V. ADMINISTRACION DE MICRONUTRIENTES</option>
              <option value="6">VI. LACTANCIA MATERNA EXCLUSIVA</option>
              <option value="7">VII. ALIMENTACIÓN COMPLEMENTARIA</option>
              <option value="8">VIII. EVALUACION DEL ESTADO NUTRICIONAL</option>
              <option value="9">IX. EVALUACION DEL DESARROLLO</option>
              <option value="10">X. PLAN DE ATENCION INTEGRAL</option>
              <option value="11">XI. CONSEJERÍA</option>
              <option value="12">XII. VISITA DOMICILIARIA</option>
              <option value="13">XIII. ESTIMULACION TEMPRANA</option>
              <option value="14">XIV. ACTIVIDADES EXTRAMURALES, MASIVAS Y DE GESTIÓN</option>
              <option value="15">XV.  ATENCION DE LAS ENFERMEDADES PREVALENTES DE LA INFANCIA</option>
              <option value="16">XVI. DEFUNCIONES</option>
              <option value="17">XVII. VIGILANCIA DEL CONSUMO DE SAL YODADA</option>
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
