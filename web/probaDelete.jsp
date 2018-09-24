<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib tagdir="/WEB-INF/tags/block" prefix="block" %>
<html>
<head>
    <title>Proba DELETE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

    <link rel="stylesheet" type="text/css" href="/static/css/example.css">

    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/buttons/1.5.0/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/select/1.2.4/css/select.dataTables.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.2.4/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.0/js/buttons.flash.min.js"></script>

    <%--<script type="text/javascript" src="static/js/js/jquery-3.3.1.min.js"></script>--%>
</head>
<body>
<block:header/>
<div class="container">
    <h1 style="background: fuchsia">Proba DELETE</h1>
    <div class="row">
        <block:left/>
        <block:tagProba/>
    </div>
</div>
<block:footer/>
<%--<script type="text/javascript" src="static/js/js/extensions/Editor/js/dataTables.altEdit.js"></script>--%>
<script type="text/javascript" src="static/js/js/extensions/Editor/js/dataTables.altEditor.free.js"></script>
<script type="text/javascript">
    /* Formatting function for row details - modify as you need */
    // function format(d) {
    //     // `d` is the original data object for the row
    //     return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
    //         '<tr>' +
    //         '<td>Full name:</td>' +
    //         '<td>' + d.user.firstName + '</td>' +
    //         '</tr>' +
    //         '<tr>' +
    //         '<td>Extension number:</td>' +
    //         '<td>' + d.price + '</td>' +
    //         '</tr>' +
    //         '<tr>' +
    //         '<td>Extra info:</td>' +
    //         '<td>And any further details here (images etc)...</td>' +
    //         '</tr>' +
    //         '</table>';
    // }

    $(function () {
        // let columnDefs: [{title: ''},
        //     {title: 'ID'},
        //     {title: 'Person'},
        //     {title: 'Product'},
        //     {title: 'Order Number'},
        //     {title: 'Price'},
        //     {title: 'User Email'},
        //     {title: 'User FName'},
        //     {title: 'Edit'},
        //     {title: 'Delete'}];
        $.ajax({
            type: 'GET',
            url: '/order/all',
            dataType: 'json',
            async: false,
            success: function (result) {
                let table = $('#example').DataTable({
                    data: result,
                    jQueryUI: true,
                    deferRender: true,
                    // scrollX: true,
                    <!-- таблица съезжает под заголовком -->
                    select: true,
                    altEditor: true,
                    columns: [
                        {
                            className: "details-control",
                            orderable: false,
                            data: null,
                            defaultContent: ""
                        },
                        {data: "id"},
                        // {data: "person"},
                        {
                            data: null, render: function (data, type, row) {
                                return data.person + ' ' + data.product;
                            }
                        },
                        {data: "product"},
                        {data: "orderNumber"},
                        // {data: "price", render: $.fn.dataTable.render.number(',', '.', 0, '$')},
                        {data: "price", render: $.fn.dataTable.render.number(',', '.', 2, '&#8381;')},
                        // {data: "orderDate"},
                        // {data: "user.accountName"},
                        // {data: "user.email"},
                        // {data: "user.firstName"},
                        // {data: "user.id"},
                        // {data: "user.lastName"},
                        // {data: "user.password"},
                        // {
                        //     data: null,
                        //     render: function (ev) {
                        //         return '<input type="button" class="editRow" value="Edit">';
                        //         // return '<input type="button" value=' + o.id + '>' + '<a>' + '<span class="glyphicon glyphicon-remove" onclick="RestDelete()" style="color: red"></span>' + '</a>'
                        //         // return '<button onclick="RestDelete()" value=' + o.id + '>' + '<a>' + '<span class="glyphicon glyphicon-remove" style="color: red"></span>' + '</a>'
                        //     }
                        // },
                        {
                            sortable: false,
                            // render: function (data, type, full, meta) {
                            //     let buttonID = "delete_" + full.id;
                            //     return '<a id=' + buttonID + ' class="btn btn-danger delete" role="button">Delete</a>';
                            // }
                            render: function (ev) {
                                // return '<input type="button" id="deleteRowBtn" value="Delete">'
                                return '<button type="button"  data-content="remove" class="btn btn-danger" id="deleteRowBtn">Delete</button>'
                            }
                        },
                        {
                            data: null,
                            // render: function (ev) {
                            //     return '<input type="button" id="editRowBtn" value="Edit"><input type="button" id="saveButton" value="Save">'
                            // }
                            render: function () {
                                return '<input type="button" class="edit" inputmode="altEditor-form" value="Edit">';
                            }
                        }
                    ],

                    language: {
                        "processing": "Подождите...",
                        "search": "Поиск:",
                        "lengthMenu": "Показать _MENU_ записей",
                        "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
                        "infoEmpty": "Записи с 0 до 0 из 0 записей",
                        "infoFiltered": "(отфильтровано из _MAX_ записей)",
                        "infoPostFix": "",
                        "loadingRecords": "Загрузка записей...",
                        "zeroRecords": "Записи отсутствуют.",
                        "emptyTable": "В таблице отсутствуют данные",
                        "paginate": {
                            "first": "Первая",
                            "previous": "Предыдущая",
                            "next": "Следующая",
                            "last": "Последняя"
                        },
                        "aria": {
                            "sortAscending": ": активировать для сортировки столбца по возрастанию",
                            "sortDescending": ": активировать для сортировки столбца по убыванию"
                        }
                    },

                    dom: 'Bfrtip',
                    buttons: [{
                        text: 'Add',
                        name: 'add' // do not change name
                    },
                        {
                            extend: 'selected', // Bind to Selected row
                            text: 'Edit',
                            name: 'edit' // do not change name
                        },
                        {
                            extend: 'selected', // Bind to Selected row
                            text: 'Delete',
                            name: 'delete' // do not change name
                        },
                        {
                            text: 'Refresh',
                            name: 'refresh'
                        }
                    ]

                    // buttons: [
                    //     {
                    //         extend: 'copyHtml5',
                    //         exportOptions: {
                    //             orthogonal: 'export',
                    //             columns: [0, 1, 3, 4]
                    //         }
                    //     },
                    //     {
                    //         extend: 'csvHtml5',
                    //         // title: 'Data export',
                    //         exportOptions: {
                    //             orthogonal: 'export',
                    //             columns: ':visible'
                    //         }
                    //     },
                    //     {
                    //         extend: 'excelHtml5',
                    //         // title: 'Data export',
                    //         exportOptions: {
                    //             orthogonal: 'export',
                    //             columns: ':visible'
                    //         }
                    //     },
                    //     {
                    //         extend: 'pdfHtml5',
                    //         download: 'open',
                    //         exportOptions: {
                    //             columns: [0, 1, 5, 3, 2, 4]
                    //         },
                    //         orientation: 'landscape',
                    //         pageSize: 'LEGAL'
                    //     },
                    //     {
                    //         extend: 'print',
                    //         text: 'Print (only selected)',
                    //         exportOptions: {
                    //             modifier: {
                    //                 selected: true
                    //             }
                    //         }
                    //     },
                    //     'colvis'
                    // ],

                });

// ChildRows -> Add event listener for opening and closing details
                $('#example tbody').on('click', 'td.details-control', function () {
                    let tr = $(this).closest('tr');
                    let row = table.row(tr);

                    if (row.child.isShown()) {
                        // This row is already open - close it
                        row.child.hide();
                        tr.removeClass('shown');
                    }
                    else {
                        // Open this row
                        row.child(format(row.data())).show();
                        tr.addClass('shown');
                    }
                });

// DELETE
//                 $("#example").on('click', '#deleteRowBtn', function () {
//                     $(this).parents('tr').remove();
//                 });

            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });

        // Do DELETE a Customer via JQUERY AJAX
        // $(document).on("click", "#deleteRowBtn", function () {
        //
        //     let customerId = $(this).parent().find('input').val();
        //     let workingObject = $(this);
        //
        //     $.ajax({
        //         type: "DELETE",
        //         url: "/order/delete/" + customerId,
        //         dataType: "json",
        //         async: false,
        //         success: function () {
        //             workingObject.closest("tr").remove();
        //         },
        //         // error: function (e) {
        //         //     alert("ERROR: ", e);
        //         //     console.log("ERROR: ", e);
        //         // }
        //         error: function (jqXHR, testStatus, errorThrown) {
        //             $('#resultMsgDiv').html(JSON.stringify(jqXHR))
        //         }
        //     });
        // });
    });
</script>
</body>
</html>