/**
 * grunt
 * CoffeeScript example
 */
module.exports = function(grunt){

  grunt.initConfig({
    coffee: {
      all: {
        dir: './'
      }
    },
    watch: {
      all: {
        files: '*.coffee',
        tasks: 'coffee:all ok'
      }
    }
  });

  grunt.loadTasks('tasks');
  grunt.registerTask('default', 'coffee ok');

};
