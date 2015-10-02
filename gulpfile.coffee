
gulp = require 'gulp'

#
#
#
gulp.task 'default', [
    'compile-dev'
    'webserver'
    'watch-src'
    'watch-bundle'
]


connect = require 'gulp-connect'

#
#
#
gulp.task 'webserver', -> connect.server { root: './src', livereload: true }

#
#
#
gulp.task 'watch-src', -> gulp.watch ['./src/main.coffee', './src/**/*.*', '!./src/bundle.js'], ['compile-dev']
gulp.task 'watch-bundle', -> gulp.watch ['./src/bundle.js'], ['reload']

#
#
#
gulp.task 'reload', ->
    gulp.src './src/*.html'
    .pipe connect.reload()


gutil = require 'gulp-util'
webpack = require 'webpack'
buildCnt = 0

#
#
#
gulp.task 'compile-dev', (func)->
    webpack require('./webpack.config')
    , (err, stats)->
        if err
            throw new gutil.PluginError '[compile-dev]', err

        gutil.log '[compile-dev]', "========== current build - #{++buildCnt} =========="
        func()
