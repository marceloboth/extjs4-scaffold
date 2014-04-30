Ext.define('<%= app_name %>.controller.<%= plural_table_name.capitalize %>', {
    extend: 'Ext.app.Controller',

    stores: ['<%= plural_table_name.capitalize %>'],

    models: ['Contato'],

    views: ['<%= singular_table_name %>.Form', '<%= singular_table_name %>.Grid'],

    refs: [{
            ref: '<%= singular_table_name %>Panel',
            selector: 'panel'
        },{
            ref: '<%= singular_table_name %>Grid',
            selector: 'grid'
        }
    ],

    init: function() {
        this.control({
            '<%= singular_table_name %>grid dataview': {
                itemdblclick: this.edit<%= singular_table_name.capitalize %>
            },
            '<%= singular_table_name %>grid button[action=add]': {
                click: this.editar<%= singular_table_name.capitalize %>
            },
            '<%= singular_table_name %>grid button[action=delete]': {
                click: this.delete<%= singular_table_name.capitalize %>
            },
            '<%= singular_table_name %>form button[action=save]': {
                click: this.update<%= singular_table_name.capitalize %>
            }
        });
    },

    edit<%= singular_table_name.capitalize %>: function(grid, record) {
        var edit = Ext.create('<%= app_name %>.view.<%= singular_table_name %>.Form').show();

        if(record){
            edit.down('form').loadRecord(record);
        }
    },

    update<%= singular_table_name.capitalize %>: function(button) {
        var win    = button.up('window'),
            form   = win.down('form'),
            record = form.getRecord(),
            values = form.getValues();

        var newRecord = false;

        if (values.id > 0){
            record.set(values);
        } else{
            record = Ext.create('<%= app_name %>.model.<%= singular_table_name.capitalize %>');
            record.set(values);
            this.get<%= plural_table_name.capitalize %>Store().add(record);
            newRecord = true;
        }

        win.close();
        this.get<%= plural_table_name.capitalize %>Store().sync();

        if (newRecord){
            this.get<%= plural_table_name.capitalize %>Store().load();
        }
    },

    delete<%= singular_table_name.capitalize %>: function(button) {

        var grid = this.get<%= singular_table_name.capitalize %>Grid(),
        record = grid.getSelectionModel().getSelection(),
        store = this.get<%= plural_table_name.capitalize %>Store();

        store.remove(record);
        this.get<%= plural_table_name.capitalize %>Store().sync();

        this.get<%= plural_table_name.capitalize %>Store().load();
    }
});
