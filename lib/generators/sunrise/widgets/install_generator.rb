require 'rails/generators'
require 'rails/generators/migration'

module Sunrise
  module Widgets
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      class_option :migrations, :type => :boolean, :default => true, :description => "Generate migrations files"

      desc "Generates post migration and model"

      def self.current_time
        @current_time ||= Time.now
        @current_time += 1.minute
      end

      def self.next_migration_number(dirname)
        current_time.strftime("%Y%m%d%H%M%S")
      end
      
      def create_models
        copy_file('widget.rb', 'app/models/widget.rb')
        copy_file('widget_position.rb', 'app/models/widget_position.rb')
        copy_file('widget_type.rb', 'app/models/widget_type.rb')
      end
      
      def copy_sweeper
        copy_file('widget_sweeper.rb', 'app/sweepers/widget_sweeper.rb')
      end
      
      def create_migration
        if options.migrations
          migration_template "create_widgets.rb", File.join('db/migrate', "sunrise_create_widgets.rb")
        end
      end
    end
  end
end
