source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'

browserify = require 'browserify'
coffeeify = require 'coffeeify'

bundleJs = (src, name, dest)->
    browserify { entries: [src], debug: true, extensions: ['.coffee'] }
    .transform coffeeify
    .bundle()
    .pipe source(name)
    .pipe buffer()
    .pipe gulp.dest(dest)



gulp = require 'gulp'

gulp.task 'default', [
    'compile'
]

gulp.task 'compile', ->
    bundleJs './src/index.coffee', 'bundle.js', './src'