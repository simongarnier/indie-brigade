desc "compile frontend js/sass and then copy those file in the app's public folder"
namespace :bridge do
  task :css do
    puts `cd indie-frontend && gulp sass`
    `rm public/css/*`
    puts `cp -v indie-frontend/css/*.css public/css/`
  end

  task :js do
    puts `cd indie-frontend && gulp js`
    `rm -f public/js/*`
    puts `cp -v indie-frontend/js/*.js public/js/`
  end

  task :images do
    puts `cp -vr indie-frontend/images/* public/images`
  end
end
