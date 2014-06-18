// =============================================================================
// TITLE:       Gulpjs Configuration
// DESCRIPTION: Project's gulp.js configuration
// =============================================================================

// Include gulp
// -----------------------------------------------------------------------------
var gulp              = require( 'gulp' ),

// Include plugins
    cache             = require( 'gulp-cache' ),
    changed           = require( 'gulp-changed' ),
    clean             = require( 'gulp-clean' ),
    gutil             = require( 'gulp-util' ),
    plumber           = require( 'gulp-plumber' ),
    // watch             = require( 'gulp-watch' ),
    rename            = require( 'gulp-rename' ),
    gulpif            = require( 'gulp-if' ),
    connect           = require( 'gulp-connect' ),
    notify            = require( 'gulp-notify' ),

    jade              = require( 'gulp-jade' ),
    // markdown          = require( 'gulp-markdown' ),

    sass              = require( 'gulp-sass' ),
    compass           = require( 'gulp-compass' ),
    scsslint          = require( 'gulp-scsslint' ),
    uncss             = require( 'gulp-uncss' );
    autoprefixer      = require( 'gulp-autoprefixer' ),
    minifycss         = require( 'gulp-minify-css' ),

    jshint            = require( 'gulp-jshint' ),
    include           = require( 'gulp-include' ),
    uglify            = require( 'gulp-uglify' ),
    concat            = require( 'gulp-concat' ),

    imagemin          = require( 'gulp-imagemin' ),
    pngcrush          = require( 'imagemin-pngcrush' ),
    svgmin            = require( 'gulp-svgmin' );
    svgSprites        = require( 'gulp-svg-sprites' );


// Variables
// -----------------------------------------------------------------------------
// Default environment
var env               = process.env.NODE_ENV || 'development';

// src and dist directories
var sources = {
      srcDir: 'compile/',
      distDir: 'public/'
    };

// Static files that are not compiled but need to be distributed in dist
var move = {
      skel: sources.srcDir + '/skeleton/**'
    };

// Files to watch in the "Watch" task
var watch = {
      sass: sources.srcDir + 'sass/**/*.scss',
      js: sources.srcDir + 'js/app/**/*.js',
      polyfills: sources.srcDir + 'js/polyfills/**/*.js',
      img: sources.srcDir + 'img/**/*.{png,gif,jpg,jpeg,ico}',
      svg: sources.srcDir + 'svg/**/*.svg',
      jade: sources.srcDir + 'jade/**/*.jade',
      html: sources.distDir + 'assets/ee/views/**/*.{html,snip}'
    };

// JS Sources
var jsIn  = [ sources.srcDir + 'js/app/main.js' ];
var polyfillsJsIn = [ sources.srcDir + 'js/polyfills/polyfills.js' ];

// DIST
var dist = {
      css: sources.distDir + 'assets/css',
      js:  sources.distDir + 'assets/js',
      img: sources.distDir + 'assets/img',
      svg: sources.distDir + 'assets/svg',
      html: sources.distDir + '_static'
    }


// Error Handling
// -----------------------------------------------------------------------------
var onError = function (err) {
  gutil.beep();
  console.log( err );
};


// Clean up task
// -----------------------------------------------------------------------------
gulp.task( 'clean', function() {
  return gulp.src( sources.distDir, { read: false } )
  .pipe( clean() )
  .pipe( notify({ message: 'Files cleaned' }) );
});


// Skeleton files
// Copy over static project files and directories that won't be compiled
// -----------------------------------------------------------------------------
gulp.task( 'skeleton', function() {
  return gulp.src( move.skel )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( gulp.dest(sources.distDir) )
    .pipe( plumber.stop() )
    .pipe( notify({
      message: 'Skeleton created',
      onLast: true
     }));
});


// SASS/SCSS Task
// -----------------------------------------------------------------------------
gulp.task('sass', function() {
  // Set the Compass config variable
  var sassConfig = {
    // config_file: './config.rb',
    style: 'expanded', // nested|expanded|compact|compressed
    comments: false,
    relative: true,
    css: 'public/assets/css',
    sass: 'compile/sass',
    javascript: 'public/assets/js',
    image: 'compile/sprites',
    // generated_images_dir: 'public/assets/sprites', // Not supported yet
    font: 'public/assets/fonts',
    logging: false,
    require: ['sass-globbing', 'compass', 'breakpoint', 'modular-scale', 'singularitygs', 'toolkit'],
    bundle_exec: false,
    sourcemap: false,
    time: false,
    debug: false
  };

  if ( env === 'development' ) {
    sassConfig.comments = true;
    sassConfig.logging = true;
    sassConfig.sourcemap = true;
    sassConfig.time = true;
    sassConfig.debug = true;
  }

  return gulp.src( watch.sass )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( changed(dist.css) )
    .pipe( compass(sassConfig) )
    .pipe( autoprefixer('last 2 version','safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4') )
    // .pipe( uncss({ html: ['public/**/*.html'] }) )
    .pipe( gulp.dest(dist.css) )
    .pipe( gulpif(env === 'production', rename({suffix: '.min'})) )
    .pipe( gulpif(env === 'production', minifycss()) )
    .pipe( gulpif(env === 'production', gulp.dest(dist.css)) )
    .pipe( plumber.stop() )
    .pipe( connect.reload() )
    .pipe( notify({ message: 'SCSS to CSS task complete' }) );
});


// JavaScript tasks
// -----------------------------------------------------------------------------
gulp.task( 'js', function() {
  return gulp.src( jsIn )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( changed(dist.js) )
    .pipe( include() )
    .pipe( gulp.dest(dist.js) )
    .pipe( gulpif(env === 'production', rename({suffix: '.min'})) )
    .pipe( gulpif(env === 'production', uglify()) )
    .pipe( gulpif(env === 'production', gulp.dest(dist.js)) )
    .pipe( plumber.stop() )
    .pipe( connect.reload() )
    .pipe( notify({ message: 'Main.js task complete' }) );
});

gulp.task( 'polyfills', function() {
  return gulp.src( polyfillsJsIn )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( changed(dist.js) )
    .pipe( include() )
    .pipe( gulp.dest(dist.js) )
    .pipe( gulpif(env === 'production', rename({suffix: '.min'})) )
    .pipe( gulpif(env === 'production', uglify()) )
    .pipe( gulpif(env === 'production', gulp.dest(dist.js)) )
    .pipe( plumber.stop() )
    .pipe( connect.reload() )
    .pipe( notify({ message: 'Polyfills.js task complete' }) );
});


// Jade task
// Converts Jade to HTML
// -----------------------------------------------------------------------------
gulp.task( 'jade', function() {
  // Set the Jade config variable
  var jadeConfig = {
    pretty: false // compressed
  };

  if ( env === 'development' ) {
    jadeConfig.pretty = true // uncompressed
  }

  return gulp.src( watch.jade )
    .pipe( changed(dist.html) )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( jade(jadeConfig) )
    .pipe( gulp.dest(dist.html) )
    .pipe( plumber.stop() )
    .pipe( connect.reload() )
    .pipe( notify({ message: 'Jade to HTML task complete' }) );
});


// Markdown task
// Converts Markdown to HTML (E.G. Documentation)
// -----------------------------------------------------------------------------
// gulp.task('markdown', function () {
//   return gulp.src( watch.md )
//     .pipe(plumber( { errorHandler: onError } ))
//     .pipe(changed( dist.md ))
//     .pipe(markdown())
//     .pipe(plumber.stop())
//     .pipe(gulp.dest( docs ))
//     .pipe(connect.reload())
//     .pipe(notify({ message: 'Markdown to HTML task complete' }))
// });


// Compress images task
// -----------------------------------------------------------------------------
gulp.task('images', function() {
  // Set the Imagemin config variable
  var imgConfig = {
    optimizationLevel: 5,
    progressive: true,
    interlaced: true,
    svgoPlugins: [{removeViewBox: false}],
    use: [pngcrush()]
  };

  if ( env === 'development' ) {
  }

  return gulp.src( watch.img )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( changed(dist.img) )
    .pipe( cache(imagemin(imgConfig)) )
    .pipe( gulp.dest(dist.img) )
    .pipe( plumber.stop() )
    // .pipe( connect.reload() )
    .pipe(notify({ message: 'Image optimization task complete' }));
});


// Optimize SVGs task
// -----------------------------------------------------------------------------
gulp.task('svgmin', function() {
  return gulp.src( watch.svg )
    .pipe( plumber({ errorHandler: onError }) )
    .pipe( changed(dist.svg) )
    .pipe( svgmin() )
    .pipe( gulp.dest(dist.svg) )
    .pipe( plumber.stop() )
    .pipe(notify({ message: 'SVG optimization task complete' }));
});


// Server task
// Unless specified below, visit: http://localhost:8080/
// -----------------------------------------------------------------------------
gulp.task( 'server', function() {
  connect.server({
    root: sources.distDir,
    // host: 'quickboot.dev', // Add entry into host file
    // port: 80,
    livereload: true
  });
});


// HTML Watch task
// Watch EECMS templates for changes
// -----------------------------------------------------------------------------
gulp.task( 'watch:html', function() {
  return gulp.src( watch.html )
    .pipe( changed(watch.html) )
    .pipe( connect.reload() )
    .pipe( notify({ message: 'Templates updated' }) );
});


// Watch task
// -----------------------------------------------------------------------------
gulp.task('watch', ['server'], function() {
  // Watch .scss files
  gulp.watch( watch.sass, ['sass'] );

  // Watch app .js files
  gulp.watch( watch.js, ['js'] );

  // Watch polyfill .js files
  gulp.watch( watch.polyfills, ['polyfills'] );

  // Watch image files
  gulp.watch( watch.img, ['images'] );

  // Watch svg files
  gulp.watch( watch.svg, ['svg'] );

  // Watch Jade files
  gulp.watch( watch.jade, ['jade'] );

  // Watch HTML files
  gulp.watch( watch.html, ['watch:html'] );

});


// Gulp It™
// -----------------------------------------------------------------------------
gulp.task('default', function() {
  gulp.start('sass', 'js', 'polyfills', 'jade', 'images', 'svgmin', 'watch');
});