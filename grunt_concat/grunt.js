module.exports = function(grunt){
  grunt.initConfig({
    concat:  {
      js: {
        src: [ '1.js', '2.js' ],
        dest: 'all.js'
      },
      css: {
        src: [ '1.css', '2.css' ],
        dest: 'all.css'
      }
    }
  });
  grunt.registerTask('default', 'concat');
};
