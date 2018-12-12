<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="2">ACTIVIDADES</th>
          <th colspan="2" v-for="n in 5">0@{{n}} años</th>
        </tr>
        <tr>
          <th v-for="n in 10">@{{ ((n-1)%2) + 1 }}º</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Administración de Profilaxis Antiparasitaria</td>
          <td v-for="n in 10">@{{n}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
