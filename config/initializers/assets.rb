# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( mobirise/style.css )
Rails.application.config.assets.precompile += %w( mobirise/style1.css )
Rails.application.config.assets.precompile += %w( mobirise/style2.css )
Rails.application.config.assets.precompile += %w( mobirise/style3.css )
Rails.application.config.assets.precompile += %w( mobirise/animate.min )
Rails.application.config.assets.precompile += %w( mobirise/mbr-additional )
Rails.application.config.assets.precompile += %w( mobirise/socicon.min )
Rails.application.config.assets.precompile += %w( normalize )
Rails.application.config.assets.precompile += %w( style)
