require 'rails'
require 'sunrise-widgets'

module Sunrise
  module Widgets
    class Engine < ::Rails::Engine
      config.before_initialize do
        Sunrise::Plugin.register :widgets do |plugin|
          plugin.model = 'sunrise/models/widget'
          plugin.menu = 'select'
          plugin.version = Sunrise::Widgets::VERSION.dup
        end
        
        Sunrise::Plugins.activate(:widgets)
      end
    end
  end
end
