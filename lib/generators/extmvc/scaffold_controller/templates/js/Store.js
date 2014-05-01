Ext.define('<%= app_name %>.store.<%= plural_table_name.capitalize %>', {
	extend: 'Ext.data.Store',
	model: '<%= app_name %>.model.<%= singular_table_name.capitalize %>',
	storeId: '<%= singular_table_name %>Store',
	autoLoad: true,
  autoSync: false,

	proxy: {
		url: "/<%= plural_table_name %>",
    type: "rest",
    format: "json",

    reader: {
    	root: "<%= plural_table_name %>",
      record: "<%= singular_table_name %>",
      successProperty: "success",
      messageProperty: "errors"
    }

    writer: {
    	getRecordData: function(record) {
    		<%= singular_table_name %>: record.data
    	}
    }
	}
});
