# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[ckeditor/config.js]
js = Dir[Rails.root.join('app/assets/**/*.js')]
sass = Dir[Rails.root.join('app/assets/**/*.scss')]
Rails.application.config.assets.precompile += js.map do |file|
  file.gsub(Rails.root.join('app/assets/javascripts/').to_s, '')
end
Rails.application.config.assets.precompile += sass.map do |file|
  file.gsub(/\.scss/, '.css').gsub(Rails.root.join('app/assets/stylesheets/').to_s, '')
end
