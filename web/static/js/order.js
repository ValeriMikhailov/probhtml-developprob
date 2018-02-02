let service = '/order';
const RestGet = function (id) {
    $.ajax({
        type: 'GET',
        url: service + '/get/' + id,
        dataType: 'json',
        async: false,
        success: function (result) {
            $('#response').html(JSON.stringify(result));
        },
        error: function (jqXHR, testStatus, errorThrown) {
            $('#response').html(JSON.stringify(jqXHR))
        }
    });
};

const RestGetAll = function () {
    $.ajax({
        type: 'GET',
        url: service + '/all',
        dataType: 'json',
        async: false,
        success: function (result) {
            $('#response').html(JSON.stringify(result));

            //     $('#example').DataTable({
            //         "data": result,
            //         "columns": [
            //             // {title: "Name"},
            //             // {title: "Position"},
            //             // {title: "Office"},
            //             // {title: "Extn."},
            //             // {title: "Start date"},
            //             // {title: "SalaryZZZZ"}
            //
            //             {"data": "id"},
            //             {"data": "person"},
            //             {"data": "product"},
            //             {"data": "orderNumber"},
            //             {"data": "price"},
            //             {"data": "orderDate"},
            //             {"data": "user.accountName"},
            //             {"data": "user.email"},
            //             {"data": "user.firstName"},
            //             {"data": "user.id"},
            //             {"data": "user.lastName"},
            //             {"data": "user.password"}
            //         ]
            //     });

        },
        error: function (jqXHR, testStatus, errorThrown) {
            $('#response').html(JSON.stringify(jqXHR))
        }
    });
};

const RestPut = function (person, product, orderNumber, price, orderDate, user_id) {
    let JSONObject = {
        'person': person,
        'product': product,
        'orderNumber': orderNumber,
        'price': price,
        'orderDate': orderDate,
        'user': {'id': user_id}
    };

    $.ajax({
        type: 'PUT',
        url: service + "/add",
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify(JSONObject),
        datatype: 'json',
        async: false,
        success: function (result) {
            $('#response').html(JSON.stringify(result));
        },
        error: function (jqXHR, testStatus, errorThrown) {
            $('#response').html(JSON.stringify(jqXHR))
        }
    });
};

const RestPost = function (id, person, product, orderNumber, price, orderDate, user_id) {
    let JSONObject = {
        'id': id,
        'person': person,
        'product': product,
        'orderNumber': orderNumber,
        'price': price,
        'orderDate': orderDate,
        'user': {'id': user_id}
    };

    $.ajax({
        type: 'POST',
        url: service + "/update",
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify(JSONObject),
        dataType: 'json',
        async: false,
        success: function (result) {
            $('#response').html(JSON.stringify(result));
        },
        error: function (jqXHR, testStatus, errorThrown) {
            $('#response').html(JSON.stringify(jqXHR))
        }
    });
};

const RestDelete = function (id) {
    $.ajax({
        type: 'DELETE',
        url: service + '/delete/' + id,
        dataType: 'json',
        async: false,
        success: function (result) {
            $('#response').html(JSON.stringify(result));
        },
        error: function (jqXHR, testStatus, errorThrown) {
            $('#response').html(JSON.stringify(jqXHR))
        }
    });
};