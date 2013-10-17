module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      app:
        expand: true
        cwd   : ''
        src   : ['app.coffee']
        dest  : 'target'
        ext   : '.js'
      server:
        expand: true
        cwd   : 'server'
        src   : ['**/*.coffee']
        dest  : 'target/server'
        ext   : '.js'
      webapp:
        expand: true
        cwd   : 'webapp/js'
        src   : '**/*.coffee'
        dest  : 'target/webapp/js'
        ext   : '.js'
      test:
        expand: true
        cwd   : 'test'
        src   : '**/*.coffee'
        dest  : 'target/test'
        ext   : '.js'
    copy:
      webapp:
        expand: true
        cwd   : 'webapp/'
        src   : ['js/**/*', 'images/**/*', 'views/**/*', 'css/**.css']
        dest  : 'target/webapp/'
    simplemocha:
      options:
        compilers: ['coffee:coffee-script']
        globals: []
        timeout: 3000
        ignoreLeaks: false
        ui: 'bdd'
        reporter: 'tap'
      all:
        src: ['test/**/*.coffee']
    less:
      options:
        paths: ['webapp/css/']
        relativeUrls: true
      compile:
        files:
          'target/webapp/css/app.css': 'webapp/css/**/*.less'
    watch:
      server:
        files: 'server/**/*.coffee'
        tasks: ['simplemocha','coffee','copy']
      test:
        files: 'test/**/*.coffee'
        tasks: ['simplemocha','coffee','copy']
      views:
        files: 'webapp/views/**/*.jade'
        tasks: ['copy']
      styles:
        files: 'webapp/**/*.less'
        tasks: ['less']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-contrib-less'

  # Default task.
  grunt.registerTask 'default', ['less','coffee','simplemocha','copy']
  grunt.registerTask 'test', ['coffee','simplemocha']

  grunt.registerTask 'node:run', () ->
    spawn = require('child_process').spawn
    runner = spawn process.argv[0], ['target/app.js'], {
      stdio: 'inherit'
      env: process.env
    }
    runner.on 'close', @async()

  grunt.registerTask 'run', ['default','node:run']