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

            // let row = '<table>';
            // for (let i in result) {
            //     row += '<td>' + result[i]['id'] + '</td>' + ' ' + '<td>' + result[i]['person']+ '</td>' + ' ' + '<td>' + result[i]['date'] + '</td><br>';
            //     row += '</table>';
            //     $('#response').html(row);
            // }

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