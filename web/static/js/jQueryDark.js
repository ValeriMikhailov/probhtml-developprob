$.ajax({
    type: 'GET',
    url: 'order/all',
    dataType: 'json',
    async: false,
    success: function (result) {
        let table = $('#customerTable').DataTable({
            data: result,
            jQueryUI: true,
            // deferRender: true,     <!-- ЛОМАЕТ индексацию строк -->
            // scrollX: true,      <!-- таблица съезжает под заголовком -->
            // deferLoading: 19,
            lengthMenu: [[3, 6, 8, -1], ['3 записи', '6 записей', '8 записей', 'Все']],
            pageLength: 10,
            select: true,
            // columnDefs: [{            // Apply the Index column Part I
            //     searchable: false,
            //     orderable: false,
            //     targets: 0
            // }],
            order: [[2, 'dsc']],    //  end of Apply the Index column Part I
            columns: [
                {data: null},
                {data: 'person'},
                {data: 'id'},
                {data: 'product'},
                {data: 'price'},
                {data: 'user.firstName'},
                {data: 'user.id'},
                {data: 'user.fired'},
                {data: 'user.id'},
                // {
                //     data: function (column, type, set) {
                //         if (type === 'display') {
                //             return column.user.password;
                //         }
                //     }
                // },
            ],
            dom: 'Bfrtip',
            buttons: [
                'pageLength',
                {
                    extend: 'copyHtml5',
                    exportOptions: {
                        orthogonal: 'export',
                        columns: [0, 1, 3]
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
                        columns: [0, 1, 3]
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
            ]
        });

        // Apply the Row selection and deletion (single row)
        // $('#customerTable tbody')
        //     .on('mouseenter', 'td', function () {
        //         let colIdx = table.cell(this).index().column;
        //
        //         $(table.cells().nodes()).removeClass('highlight');
        //         $(table.column(colIdx).nodes()).addClass('highlight');
        //     });     //  end of  Apply the Row selection and deletion (single row)
        //
        // // Apply the Index column Part II
        // table.on('order.dt search.dt', function () {
        //     table.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
        //         cell.innerHTML = i + 1;
        //     });
        // }).draw();     //  end of Apply the Index column Part II

    }
});
