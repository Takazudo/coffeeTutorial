module.exports = function(grunt){
  grunt.initConfig({
    min: {
      all: {
        src: ['all.js'],
        dest: 'all.min.js'
      }
    }
  });
  grunt.registerTask('default', 'min');
};
