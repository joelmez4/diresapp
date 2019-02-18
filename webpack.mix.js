let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

 // mix.js('resources/assets/js/app.js', 'public/js')
 //    .sass('resources/assets/sass/app.scss', 'public/css');


// mix.js('resources/assets/js/indicadores/appProfilaxis.js', 'public/js/indicadores')
//    .sass('resources/assets/sass/app.scss', 'public/css');

  // mix.js('resources/assets/js/indicadores/appMorbilidad.js', 'public/js/indicadores')
  //  .sass('resources/assets/sass/app.scss', 'public/css');

   mix.js('resources/assets/js/app.js', 'public/js')
       .js('resources/assets/js/indicadores/appProfilaxis.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appMorbilidad.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appOcular.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appCancer.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appInmunizaciones.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appAnemiaSeg.js', 'public/js/indicadores')
       .js('resources/assets/js/indicadores/appAnemiaDef.js', 'public/js/indicadores')
       // .js('resources/assets/js/navmenu.js', 'public/js')
       .sass('resources/assets/sass/app.scss', 'public/css');

/* eXAMPLE */
   // mix.js('resources/assets/js/admin.js', 'public/js')
   //     .js('resources/assets/js/frontend.js', 'public/js')
   //     .sass('resources/assets/sass/app.scss', 'public/css');
