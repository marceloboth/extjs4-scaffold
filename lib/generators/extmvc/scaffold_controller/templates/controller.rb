class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, except: :index

  def index
    render json: <%= class_name %>.all
  end

  def create
    <%= singular_table_name %> = <%= class_name %>.new(safe_params)
    <%= singular_table_name %>.save

    if <%= singular_table_name %>.valid?
      render json: <%= singular_table_name %>, status: 201
    else
      render json: <%= singular_table_name %>, success: false, errors: <%= singular_table_name %>.errors
    end
  end

  def update
    <%= singular_table_name %>.update_attributes(safe_params)

    if <%= singular_table_name %>.valid?
      render json: <%= singular_table_name %>, status: 204
    else
      render json: <%= singular_table_name %>, success: false, errors: <%= singular_table_name %>.errors
    end
  end

  def destroy
    <%= singular_table_name %>.destroy
    render nothing: true, status: 204
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> ||= <%= class_name %>.find(params[:id])
    end

    def safe_params
      params.require(:task).permit(:id<% attributes.each_with_index do |attribute, index| %>, :<%= attribute.name %><% end %>)
    end
end
