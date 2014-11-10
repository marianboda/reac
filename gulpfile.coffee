gulp = require('gulp')
react = require('gulp-react')

gulp.task 'build', ->
  gulp.src('*.jsx')
    .pipe(react())
    .pipe(gulp.dest(''))
