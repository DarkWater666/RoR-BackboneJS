require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RorBackbone

  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/modules)
    config.time_zone = 'Europe/Moscow'

    config.i18n.default_locale = :ru
    I18n.enforce_available_locales = false
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += Ckeditor.assets
    config.assets.precompile += %w(ckeditor/*)

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.active_record.raise_in_transactional_callbacks = true

  end

end
