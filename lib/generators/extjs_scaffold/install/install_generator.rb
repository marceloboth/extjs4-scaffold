require 'generators/extjs_scaffold'

module ExtjsScaffold
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :file_name, :desc => "Name of file used to hold Ext.application",
                    :aliases => '-n', :default => ExtjsScaffold::Generators::Base.rails_app_name
      class_option :app_name, :desc => "Name of app used in Ext.application",
                    :aliases => '-a', :default => ExtjsScaffold::Generators::Base.rails_app_name

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def css_and_images
        copy_file 'extjs_scaffold.css.scss', 'app/assets/stylesheets/extjs_scaffold.css.scss'
        directory 'images', 'app/assets/images/extjs_scaffold'
      end

      def create_application_file
        empty_directory File.join("app/assets", "javascripts")
        template 'app.js', File.join('app/assets/javascripts/', app_file_name)
      end

      def create_app_folder
        empty_directory File.join("app/assets/javascripts", "app")
      end

      def create_util_file
        empty_directory File.join("app/assets/javascripts/app", "util")
      end

      def create_ux_files
        empty_directory File.join("app/assets/javascripts/app", "ux")
      end

      protected

      def app_file_name
        #file_name = options.file_name || rails_app_name
        [options.file_name, :js].compact.join(".")
      end

      def app_name
        options.app_name
      end

    end
  end
end
