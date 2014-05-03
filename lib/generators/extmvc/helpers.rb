module Extmvc
  module Generators
    module Helpers

      def asset_path
        File.join('app', 'assets')
      end

      def javascript_path
        File.join(asset_path, 'javascripts')
      end

      def extjs_app_path
        File.join(javascript_path, "app")
      end

      def extjs_model_path
        File.join(extjs_app_path, "model")
      end

      def extjs_controller_path
        File.join(extjs_app_path, "controller")
      end

      def extjs_store_path
        File.join(extjs_app_path, "store")
      end

      def extjs_view_path
        File.join(extjs_app_path, "views")
      end

      def singular_file_name
        "#{file_name.singularize}#{@ext}"
      end

      def plural_file_name
        "#{file_name.pluralize}#{@ext}"
      end

      def router_file_name
        "#{file_name.pluralize}_router#{@ext}"
      end

      def view_file_name
        "#{file_name.pluralize}_index#{@ext}"
      end

      def model_namespace
        [app_name, "Models", file_name.singularize.camelize].join(".")
      end

      def collection_namespace
        [app_name, "Collections", file_name.pluralize.camelize].join(".")
      end

      def router_namespace
        [app_name, "Routers", file_name.pluralize.camelize].join(".")
      end

      def view_namespace
        [app_name, "Views", "#{file_name.pluralize.camelize}Index"].join(".")
      end

      def template_namespace
        File.join(file_path.pluralize, "index")
      end

      def app_name
        rails_app_name.camelize
      end

      def app_filename
        rails_app_name.underscore
      end

      def rails_app_name
        Rails.application.class.name.split('::').first
      end
    end
  end
end
