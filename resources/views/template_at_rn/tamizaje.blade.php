<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th colspan="2">ACTIVIDADES</th>
          <!-- <th colspan="8">Número de Evaluaciones Antropométricas</th> -->
          <th v-for="n in 8">@{{n}} m</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td rowspan="2">1. Detección de Anemia</td>
          <td>Solicitud de Dosaje de Hb</td>
          <td v-for="n in 8">@{{n}}</td>
        </tr>
        <tr>
          <td>Resultados Evaluados</td>
          <td v-for="n in 8">@{{n}}</td>
        </tr>
        <tr>
          <td rowspan="2">2. Descarte de Parasitosis</td>
          <td>Solicitud de Examen</td>
          <td v-for="n in 8">@{{n}}</td>
        </tr>
        <tr>
          <td>Resultados Evaluados</td>
          <td v-for="n in 8">@{{n}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
