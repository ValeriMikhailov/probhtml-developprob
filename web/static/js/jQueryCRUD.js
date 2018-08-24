$(document).ready(function () {
    let columnDefs = [
        {
            title: "Person",
            data: "person"
        },
        {
            title: "Product",
            data: "product"
        },
        {
            title: "Price",
            data: "price"
        },
        {
            title: "Button",
            sortable: false,
            data: null,
            render: function () {
                return '<input type="button" class="" value="Edit" name="edit" id="editRowBtn">'
            }
        }];
    $.ajax({
        url: 'order/all',
        async: false,
        callback: 'callback',
        crossDomain: true,
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        dataType: 'json',
        success: function (result) {
            let myTable = $('#customerTable').DataTable({
                data: result,
                columns: columnDefs,
                dom: 'Bfrtip',        // Needs button container
                select: 'single',
                responsive: true,
                altEditor: true,     // Enable altEditor
                buttons: [
                    {
                        text: 'Add',
                        name: 'add'        // do not change name
                    },
                    {
                        extend: 'selected', // Bind to Selected row
                        text: 'Edit',
                        name: 'edit'        // do not change name
                    },
                    {
                        extend: 'selected', // Bind to Selected row
                        text: 'Delete',
                        name: 'delete'      // do not change name
                    },
                    {
                        text: 'Refresh',
                        name: 'refresh'      // do not change name
                    }
                ]
            });
        }
    });
});