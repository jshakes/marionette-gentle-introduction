module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        files:
          "assets/js/app.js": "assets/coffee/**/*.coffee"

    watch:
      compile_coffee:
        files: ["assets/coffee/**/*.coffee"]
        tasks: ["coffee:compile"]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"