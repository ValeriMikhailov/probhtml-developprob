<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib tagdir="/WEB-INF/tags/block" prefix="block" %>
<html>
<head>
    <title>Proba DELETE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

    <%--<link rel="stylesheet" type="text/css" href="../css/example.css">--%>

    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/buttons/1.5.0/css/buttons.dataTables.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/select/1.2.4/css/select.dataTables.min.css">

    <%--<link rel="stylesheet" type="text/css" href="../css/extensions/Editor/css/editor.dataTables.min.css">--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
</body>
</html>
<script type="text/javascript">
    let service = '/order';
    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: service + '/all',
            dataType: 'json',
            async: false,
            success: function (result) {
                $('#example').DataTable({
                    data: result,
                    jQueryUI: true,
                    deferRender: true,
                    scrollX: true,
                    columns: [
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
                        {
                            data: null, render: function (data) {
                                return '</a>' + '<input type="hidden" value=' + data.id + '>' + '<a>' + '<span class="glyphicon glyphicon-remove" style="color: red"></span>' + '</a>' + '&nbsp;'
                                + '</a>' + '<input type="hidden" value=' + data.id + '>' + '<a>' + '<span class="glyphicon glyphicon-edit" style="color: blue"></span>' + '</a>'
                            }
                        },
                        // {
                        //     data: null, render: function (o) {
                        //         return '<a href=#/' + o.id + '>' + 'Delete' + '</a>';
                        //     }
                        // }
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

                    select: true

                });
            },
            error: function (jqXHR, testStatus, errorThrown) {
                $('#response').html(JSON.stringify(jqXHR))
            }
        });

        // Do DELETE a Customer via JQUERY AJAX
        $(document).on("click", "a", function () {

            let customerId = $(this).parent().find('input').val();
            let workingObject = $(this);

            $.ajax({
                type: "DELETE",
                url: service + "/delete/" + customerId,
                // dataType: "json",
                // async: false,
                success: function () {
                    workingObject.closest("tr").remove();
                },
                // error: function (e) {
                //     alert("ERROR: ", e);
                //     console.log("ERROR: ", e);
                // }
                error: function (jqXHR, testStatus, errorThrown) {
                    $('#resultMsgDiv').html(JSON.stringify(jqXHR))
                }
            });
        });
    });
</script>