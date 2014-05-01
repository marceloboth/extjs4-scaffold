class <%= singular_table_name.capitalize %>Serializer < ActiveModel::Serializer
  attributes :id<% attributes.each_with_index do |attribute, index| %>, :<%= attribute.name %><% end %>
end
