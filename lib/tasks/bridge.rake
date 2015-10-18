desc "compile frontend js/sass and then copy those file in the app's public folder"
task :bridge do
  puts `cd indie-frontend && gulp sass`
  puts `cd indie-frontend && gulp js`
  `rm -f public/js/*; rm public/css/*; rm -r public/images/*`
  puts `cp -v indie-frontend/css/*.css public/css/`
  puts `cp -v indie-frontend/js/*.js public/js/`
  puts `cp -vr indie-frontend/images/* public/images`
end
