module.exports = function(grunt){
  grunt.loadNpmTasks('grunt-coffee');
  grunt.initConfig({
    coffee: {
      all: {
        src: [
          'coffee/1.coffee',
          'coffee/2.coffee'
        ],
        dest: 'js'
      }
    },
    watch: {
      all: {
        files: '<config:coffee.all.src>',
        tasks: 'coffee'
      }
    }
  });
  grunt.registerTask('default', 'coffee');
};
