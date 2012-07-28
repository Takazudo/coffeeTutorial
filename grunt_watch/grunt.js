module.exports = function(grunt){
  grunt.initConfig({
    concat:  {
      all: {
        src: [ '1.js', '2.js' ],
        dest: 'all.js'
      },
    },
    min: {
      all: {
        src: ['all.js'],
        dest: 'all.min.js'
      }
    },
    watch: {
      all: {
        files: '<config:concat.all.src>',
        tasks: 'concat min'
      }
    }
  });
  grunt.registerTask('default', 'concat min');
};
