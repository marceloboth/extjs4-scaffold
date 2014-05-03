require 'generators/extmvc/helpers'

module Extmvc
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Extmvc::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Extjs mvc skeleton directory structure"

      class_option :javascript,
                    type: :boolean,
                    aliases: "-j",
                    default: false,
                    desc: "Generate JavaScript"

      class_option :manifest,
                    type: :string,
                    aliases: "-m",
                    default: "application.js",
                    desc: "Javascript manifest file to modify (or create)"

      def create_dir_layout
        empty_directory extjs_model_path
        empty_directory extjs_store_path
        empty_directory extjs_controller_path
        empty_directory extjs_view_path
      end

      def create_app_file
        js = options.javascript
        ext = js ? ".js" : ".js.coffee"
        template "app#{ext}", "#{javascript_path}/#{app_filename}#{ext}"
      end
    end
  end
end
