<div class="columns">
  <p>A) Sulfato Ferroso y Multimicronutriente (en polvo)</p>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="2">ACTIVIDADES</th>
          <th colspan="13">DOSIS</th>
        </tr>
        <tr>
          <th v-for="n in 12">@{{ n }}º</th>
          <th>TA</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>< 06 meses (BPN y Prematuros (SF))</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 4 a 5 meses (Sulfato Ferroso)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 6 a 11 meses (MMN)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 1 año (MMN)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 2 año (MMN)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 3 año (MMN)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td>De 4 año (MMN)</td>
          <td v-for="n in 13">0</td>
        </tr>
        <tr>
          <td colspan="14">Los Suplementados son los que CONSUMEN 360 sobres de MMN (a partir de los 18 meses, no antes) para indicar que se ha consumido el último sobre de MMN se registra TA</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="columns">
  <p>B) Vitamina "A"</p>
</div>
<div class="columns">
  <div class="column">
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th></th>
          <th colspan="2">06 meses</th>
          <th colspan="2" v-for="n in 4">0@{{n}} años</th>
        </tr>
        <tr>
          <th>Dosis</th>
          <th v-for="n in 10">@{{ ((n+1)%2)+1 }}º Dosis</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Suplementos</td>
          <td v-for="n in 10">0</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
