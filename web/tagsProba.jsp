<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib tagdir="/WEB-INF/tags/block" prefix="block" %>
<html>
<head>
    <title>PROBA TAG</title>
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

</head>
<body>
<block:header/>
<div class="container">
    <p style="background: lightblue; font-size: 36px">Добро пожаловать! Сегодня <%= getFormattedDate() %></p>
    <br>
    <div class="row">
        <block:left/>
        <block:tagProba/>
    </div>
</div>
<block:footer/>

<script type="text/javascript" src="static/js/order.js"></script>
<script type="text/javascript">
    /* Formatting function for row details - modify as you need */
    function format(d) {
        // `d` is the original data object for the row
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            '<tr>' +
            '<td>Full name:</td>' +
            '<td>' + d.user.firstName + '</td>' +
            '</tr>' +
            '<tr>' +
            '<td>Extension number:</td>' +
            '<td>' + d.price + '</td>' +
            '</tr>' +
            '<tr>' +
            '<td>Extra info:</td>' +
            '<td>And any further details here (images etc)...</td>' +
            '</tr>' +
            '</table>';
    }

    $(function () {
        $.ajax({
            type: 'GET',
            url: '/order/all',
            dataType: 'json',
            async: false,
            success: function (result) {
                let table = $('#example').DataTable({
                    data: result,
                    // jQueryUI: true,
                    deferRender: true,
                    // scrollX: true,
                    <!-- таблица съезжает под заголовком -->
                    select: true,
                    // altEditor: true,
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
                        {data: "user.email"},
                        {data: "user.firstName"},
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
                                return '<input type="button" id="deleteRowBtn" value="Delete">'
                            }
                        },
                        {
                            data: null,
                            // render: function (ev) {
                            //     return '<input type="button" id="editRowBtn" value="Edit"><input type="button" id="saveButton" value="Save">'
                            // }
                            render: function (ev) {
                                return '<input type="button" class="edit" inputmode="altEditor-form" value="Edit">';
                            }
                        }
                    ],

                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            exportOptions: {
                                orthogonal: 'export',
                                columns: [0, 1, 3, 4]
                            }
                        },
                        {
                            extend: 'csvHtml5',
                            // title: 'Data export',
                            exportOptions: {
                                orthogonal: 'export',
                                columns: ':visible'
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            // title: 'Data export',
                            exportOptions: {
                                orthogonal: 'export',
                                columns: ':visible'
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            download: 'open',
                            exportOptions: {
                                columns: [0, 1, 5, 3, 2, 4]
                            },
                            orientation: 'landscape',
                            pageSize: 'LEGAL'
                        },
                        {
                            extend: 'print',
                            text: 'Print (only selected)',
                            exportOptions: {
                                modifier: {
                                    selected: true
                                }
                            }
                        },
                        'colvis'
                    ],
                });

                // Add event listener for opening and closing details
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

            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });

// DELETE
//         $("#example").on('click', '#deleteRowBtn', function (ev) {
//             $(this).parents('tr').remove();
//         });

// EDIT & SAVE
//         $("#example").on("click", "#editRowBtn", function (ev) {
//             $(this).parents(".tabrow").removeClass("closed").addClass("editing");
//         });

        // $("#example").on("click", "#saveButton", function (ev) {
        //     var row = $(this).parents(".tabrow");
        //     // update the cells
        //     row.find("td").each(function () {
        //         // new value
        //         var newVal = $(this).find("input").val();
        //         $(this).find("div:first").html(newVal);
        //     });
        //     row.removeClass("editing").addClass("closed");
        // });

    });
</script>
<%--<script src="static/js/js/extensions/Editor/js/dataTables.altEditor.free.js"></script>--%>
<%--<script src="static/js/formWidget.js"></script>--%>
<%--<script src="static/js/student_phone.js"></script>--%>
</body>
</html>
<%!
    String getFormattedDate() {
//        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy hh:mm:ss");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MMM.dd");
        return sdf.format(new Date());
    }
%>