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
        empty_directory extjs_app_path
        empty_directory extjs_model_path
        empty_directory extjs_store_path
        empty_directory extjs_controller_path
        empty_directory extjs_view_path
      end

      def create_home_controller
        template "home_controller.rb", "app/controllers/home_controller.rb"
      end

      def create_home_view
        empty_directory File.join("app/views", "home")
        template 'index.html.erb', "app/views/home/index.html.erb"
      end

      def add_root_url
        app_init = "\n"
        app_init << "  root to: 'home#index'\n"
        insert_into_file "config/routes.rb", app_init, :after => "Application.routes.draw do"
      end

      def create_app_file
        js = options.javascript
        ext = js ? ".js" : ".js.coffee"
        template "app#{ext}", "#{javascript_path}/app#{ext}"
      end

      def inject_extjs_in_javascript_path
        manifest = File.join(javascript_path, options.manifest)
        libs = %w(extjs4/ext-all-debug)

        out = []
        out << libs.map{ |lib| "//= require #{lib}" }
        out = out.join("\n") + "\n"

        in_root do
          create_file(manifest) unless File.exists?(manifest)
          if File.open(manifest).read().include?('//= require_tree')
            inject_into_file(manifest, out, before: '//= require_tree')
          else
            append_file(manifest, out)
          end
        end
      end

      def inject_extjs_in_stylesheet_path
        manifest = File.join(stylesheet_path, options.manifest)
        libs = %w(extjs4/resources/css/ext-all)

        out = []
        out << libs.map{ |lib| " *= require #{lib}" }
        out = out.join("\n") + "\n"

        in_root do
          manifest_css = stylesheet_path + "/application.css"

          create_file(manifest_css) unless File.exists?(manifest_css)

          if File.open(manifest_css).read().include?('*= require_tree')
            inject_into_file(manifest_css, out, before: ' *= require_tree')
          else
            append_file(manifest_css, out)
          end
        end
      end

    end
  end
end
