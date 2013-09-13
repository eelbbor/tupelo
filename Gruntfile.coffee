module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      server:
        expand: true
        cwd: 'server'
        src: ['**/*.coffee']
        dest: 'target/server'
        ext: '.js'
      webapp:
        expand: true
        cwd   : 'webapp/javascripts'
        src   : '**/*.coffee'
        dest  : 'target/webapp/javascripts'
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
        src   : ['lib/**', 'images/**', 'views/**', 'css/**.css']
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
    watch:
      server:
        files: 'server/**/*.coffee'
        tasks: ['simplemocha']
      test:
        files: 'test/**/*.coffee'
        tasks: ['simplemocha']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-simple-mocha'

  # Default task.
  grunt.registerTask 'default', ['coffee','copy']
  grunt.registerTask 'test', ['simplemocha']
