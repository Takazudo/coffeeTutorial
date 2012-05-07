/**
 * grunt
 * CoffeeScript example
 */
module.exports = function(grunt){

  grunt.initConfig({
    coffeelint: {
      all: {
        files: [ 'scripts.coffee' ]
      }
    },
    coffee: {
      all: {
        dir: './'
      }
    },
    watch: {
      all: {
        files: '*.coffee',
        tasks: 'coffeelint:all coffee:all ok'
      }
    }
  });

  grunt.loadTasks('tasks');
  grunt.registerTask('default', 'coffeelint coffee ok');

};
