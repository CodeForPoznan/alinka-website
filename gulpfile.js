"use strict";

var gulp = require("gulp");
var sass = require("gulp-sass");
var sourcemaps = require('gulp-sourcemaps');

sass.compiler = require("node-sass");

gulp.task("sass", function () {
  return gulp
    .src("assets/scss/*.scss")
    .pipe(sourcemaps.init())
    .pipe(sass().on("error", sass.logError))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest("assets/css/"));
});

gulp.task("sass:watch", function () {
  gulp.watch("assets/scss/*.scss", gulp.series("sass"));
});
