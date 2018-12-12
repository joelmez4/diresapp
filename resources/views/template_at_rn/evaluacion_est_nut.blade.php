<div class="columns">
  <p>A) En el Recién Nacido de 01 día a 28 días</p>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th>Clasificación: Peso al Nacer</th>
          <th>Nº</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Extremadamente bajo</td>
          <td>0</td>
        </tr>
        <tr>
          <td>Muy bajo peso al nacer</td>
          <td>0</td>
        </tr>
        <tr>
          <td>Bajo peso al nacer</td>
          <td>0</td>
        </tr>
        <tr>
          <td>Normal</td>
          <td>0</td>
        </tr>
        <tr>
          <td>Macrosómico</td>
          <td>0</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="columns">
  <p>B) En los Niños y Niñas de 29 días a < 05 años</p>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="3">GRUPO DE EDAD</th>
          <th colspan="4">Ganancia Inadecuada de Peso o Talla</th>
          <th rowspan="3">Normal</th>
        </tr>
        <tr>
          <th colspan="2">Peso</th>
          <th colspan="2">Talla</th>
        </tr>
        <tr>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>< 1 año</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
        </tr>
        <tr>
          <td>1 año</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
        </tr>
        <tr>
          <td>2 años</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
        </tr>
        <tr>
          <td>3 años</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
        </tr>
        <tr>
          <td>4 años</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
          <td>0</td>
        </tr>
      </tbody>
    </table>
    <p><b>Dx</b>: Diagnosticado <b>Recup</b>: Recuperado</p>
  </div>
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th>RN Bajo Peso Recuperados</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>0</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="3">GRUPO DE EDAD</th>
          <th colspan="4">Peso para la Edad (PE)</th>
          <th colspan="8">Peso para la Edad (TP)</th>
          <th colspan="4">Talla para la Edad (TE)</th>
        </tr>
        <tr>
          <th colspan="2">Sobrepeso</th>
          <th colspan="2">Desnutrición</th>

          <th colspan="2">Obesidad</th>
          <th colspan="2">Sobrepeso</th>
          <th colspan="2">Desnutrición Aguda</th>
          <th colspan="2">Desnutrición Severa</th>

          <th colspan="2">Alto</th>
          <th colspan="2">Talla Baja</th>
        </tr>
        <tr>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>

          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>

          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>< 1 año</td>
          <td v-for="n in 16">0</td>
        </tr>
        <tr>
          <td>1 año</td>
          <td v-for="n in 16">0</td>
        </tr>
        <tr>
          <td>2 años</td>
          <td v-for="n in 16">0</td>
        </tr>
        <tr>
          <td>3 años</td>
          <td v-for="n in 16">0</td>
        </tr>
        <tr>
          <td>4 años</td>
          <td v-for="n in 16">0</td>
        </tr>
      </tbody>
    </table>
    <p><b>Dx</b>: Diagnosticado <b>Recup</b>: Recuperado</p>
  </div>
</div>
<div class="columns">
  <p>C) En los Niños y Niñas de 05 a 11 años</p>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="3">GRUPO DE EDAD</th>
          <th colspan="8">Índice de Masa Cororal (IMC)</th>
          <th colspan="6">Talla para la Edad (TE)</th>
          <th rowspan="3">Normal</th>
        </tr>
        <tr>
          <th colspan="2">Obesidad</th>
          <th colspan="2">Sobrepeso</th>
          <th colspan="2">Delgadez</th>
          <th colspan="2">Delgadez Severa</th>

          <th colspan="2">Alto</th>
          <th colspan="2">Talla Baja</th>
          <th colspan="2">Talla Baja Severa</th>

        </tr>
        <tr>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>

          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
          <th>Dx.</th>
          <th>Recup.</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>05 a 11 años</td>
          <td v-for="n in 15">0</td>
        </tr>
      </tbody>
    </table>
    <p><b>Dx</b>: Diagnosticado <b>Recup</b>: Recuperado</p>
  </div>
</div>
