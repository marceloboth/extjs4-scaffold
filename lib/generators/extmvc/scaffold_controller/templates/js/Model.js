Ext.define('<%= app_name %>.model.<%= singular_table_name.capitalize %>', {
	extend: 'Ext.data.Model',

	fields: [
		{	name: 'id', type: 'int'}<% attributes.each_with_index do |attribute, index| %>,
		{	<%= create_ext_record(attribute) -%> }<% if attribute.reference? -%>,	{	name: '<%= attribute.name %>_id'}	<% end %>	<% end %>
	]
});
