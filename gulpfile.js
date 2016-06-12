var gulp = require('gulp');
var shell = require('gulp-shell');
var ssh = require('gulp-ssh');
var fs = require('fs');

var ssh_config = {
		host: '185.135.8.201',
		port: 22,
		username: 'root',
		privateKey: fs.readFileSync('/Users/KryDos/.ssh/id_rsa')
};

var gulpssh = new ssh({
		ignoreErrors: false,
		sshConfig: ssh_config
});


gulp.task('default', shell.task([
		'jekyll serve'
]));

gulp.task('build', shell.task([
		'jekyll build'
]));

gulp.task('clear_production', function() {
		return gulpssh.shell([
				'cd /var/www/html/codelearn.me',
				'rm -rf *'
		])
});

gulp.task('deploy', ['build', 'clear_production'], function() {
		return gulp.src(['./_site/**', '!**/node_modules/**'])
				.pipe(gulpssh.dest('/var/www/html/codelearn.me/'));
});
