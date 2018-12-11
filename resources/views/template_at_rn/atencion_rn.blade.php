<div class="columns">
  <div class="column">
    <p class="notification is-info">A) Atención Inmediata</p>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>ACTIVIDADES</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>Atención Inmediata</td>
          <td>@{{atencion_recien_nacido.atencion_inmediata}}</td>
        </tr>
        <tr>
          <td>Tamizaje Neonatal (Enfermed. Metabólicas)</td>
          <td>@{{atencion_recien_nacido.tamizaje_neonatal}}</td>
        </tr>
        <tr>
          <td>Tamizaje Visual y Auditivo</td>
          <td>@{{atencion_recien_nacido.tamizaje_va}}</td>
        </tr>
        <tr>
          <td>Contacto Piel a Piel con la madre</td>
          <td>@{{atencion_recien_nacido.contacto_piel_madre}}</td>
        </tr>
        <tr>
          <td>Alojamiento Conjunto</td>
          <td>@{{atencion_recien_nacido.alojamiento_conjunto}}</td>
        </tr>
        <tr>
          <td>Lactancia Materna en la 1º Hora</td>
          <td>@{{atencion_recien_nacido.lactancia_materna_hora}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="column">
    <p class="notification is-info">B) Resultados del Tamizaje Neonatal</p>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>DIAGNÓSTICOS</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>Hipotiroidismo Congénito</td>
          <td>@{{atencion_recien_nacido.hipotiroidismo_congenito}}</td>
        </tr>
        <tr>
          <td>Fenilcetonuria</td>
          <td>@{{atencion_recien_nacido.fenilcetonuria}}</td>
        </tr>
        <tr>
          <td>Galactosemia</td>
          <td>@{{atencion_recien_nacido.galactosemia}}</td>
        </tr>
        <tr>
          <td>Hiperplasia Suprarrenal Congénita</td>
          <td>@{{atencion_recien_nacido.hiperplasia_suprarrenal_congenita}}</td>
        </tr>
        <tr>
          <td>Fibrosis Quística</td>
          <td>@{{atencion_recien_nacido.fibrosis_quistica}}</td>
        </tr>
        <tr>
          <td>Catarata Congénita</td>
          <td>@{{atencion_recien_nacido.catarata_congenita}}</td>
        </tr>
        <tr>
          <td>Hipoacusia (todas las clasificaciones)</td>
          <td>@{{atencion_recien_nacido.hipoacusia}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="column">
    <p class="notification is-info">C) Condición al Nacimiento</p>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <tr>
          <th rowspan="2">CONDICIÓN</th>
          <th colspan="3">Lugar de Nacimiento</th>
        </tr>
        <tr>
          <th>EESS</th>
          <th>Domicilio</th>
          <th>Total</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>RN Normal</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>RN Deprimido </td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>Prematuro</td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="columns">
  <div class="column">
    <p class="notification is-info">D) Morbilidad Neonatal</p>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>CAUSAS DE MORBILIDAD</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>Síndrome de Dristres Respiratorio</td>
          <td>@{{atencion_recien_nacido.sindrome_dristres_respiratorio}}</td>
        </tr>
        <tr>
          <td>Síndromes de Aspiración Neonatal</td>
          <td>@{{atencion_recien_nacido.sindromes_aspiracion_neonatal}}</td>
        </tr>
        <tr>
          <td>Asfixia Neonatal</td>
          <td>@{{atencion_recien_nacido.asfixia_neonatal}}</td>
        </tr>
        <tr>
          <td>Sepsis Neonatal</td>
          <td>@{{atencion_recien_nacido.sepsis_neonatal}}</td>
        </tr>
        <tr>
          <td>Ictericia</td>
          <td>@{{atencion_recien_nacido.ictericia}}</td>
        </tr>
        <tr>
          <td>Hipoglucemia</td>
          <td>@{{atencion_recien_nacido.hipoglucemia}}</td>
        </tr>
        <tr>
          <td>Sífilis Congénita</td>
          <td>@{{atencion_recien_nacido.sifilis_congenita}}</td>
        </tr>
        <tr>
          <td>VIH Expuesto</td>
          <td>@{{atencion_recien_nacido.vih_expuesto}}</td>
        </tr>
        <tr>
          <td>Retinopatía de la Prematuridad</td>
          <td>@{{atencion_recien_nacido.retinopatia_prematuridad}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="column">
    <p class="notification is-info">E) Mortalidad Neonatal</p>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>PESO AL NACER</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>< 1,000 gr.</td>
          <td id="nino23"></td>
        </tr>
        <tr>
          <td>1,000 a 1,499 gr.</td>
          <td id="nino24"></td>
        </tr>
        <tr>
          <td>1,500 a 2,499 gr.</td>
          <td id="nino25"></td>
        </tr>
        <tr>
          <td>2,500 a 4,000 gr.</td>
          <td id="nino26"></td>
        </tr>
        <tr>
          <td>> 4,000 y más gr.</td>
          <td id="nino27"></td>
        </tr>
        <tr>
          <td>No especificado</td>
          <td id="nino28"></td>
        </tr>
      </tbody>
    </table>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>TIEMPO DE VIDA</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>Óbito fetal</td>
          <td id="nino29"></td>
        </tr>
        <tr>
          <td>< 24 horas</td>
          <td id="nino30"></td>
        </tr>
        <tr>
          <td>01 a 07 días</td>
          <td id="nino31"></td>
        </tr>
        <tr>
          <td>08 a 28 días</td>
          <td id="nino32"></td>
        </tr>
      </tbody>
    </table>
    <table id="iseqchart" class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
      <thead>
        <th>Causas Defunción</th>
        <th>Nº</th>
      </thead>
      <tbody>
        <tr>
          <td>Asfixia</td>
          <td id="nino33"></td>
        </tr>
        <tr>
          <td>SDR</td>
          <td id="nino34"></td>
        </tr>
        <tr>
          <td>Sepsis</td>
          <td id="nino35"></td>
        </tr>
        <tr>
          <td>Malformaciones Congénitas</td>
          <td id="nino36"></td>
        </tr>
        <tr>
          <td>Otras</td>
          <td id="nino37"></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
