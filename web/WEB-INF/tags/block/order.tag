<%@tag pageEncoding="UTF-8" %>

<div class="col-sm-9" style="font-size: 26px">
    <table class="table">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>ORDER</th>
        </tr>
        <tr>
            <td>GET Order by ID</td>
            <td><code><strong>GET</strong>/order/get/{id}</code></td>
            <td>
                Id: <input id="getOrderById" value=""/>
                <button type="button" onclick="RestGet($('#getOrderById').val())">Try</button>
            </td>
        </tr>
        <tr>
            <td>GET All Orders</td>
            <td><code><strong>GET ALL</strong>/order/all</code></td>
            <td>
                <button type="button" onclick="RestGetAll()">All</button>
            </td>
        </tr>
        <tr>
            <td>Add order</td>
            <td><code><strong>PUT</strong>/order/add</code></td>
            <td>
                <form class="form-inline">
                    Person: <input type="text" id="putPerson" value="Student">
                    Product: <input type="text" id="putProduct" value="glass of water">
                    Order Number: <input type="text" id="putOrderNumber" value="13">
                    Price: <input type="text" id="putPrice" value="13.13">
                    Order Date: <input type="text" id="putOrderDate" value="2000-01-01">
                    User id: <input type="text" id="putUser" value="3">
                    <button type="button"
                            onclick="RestPut($('#putPerson').val(), $('#putProduct').val(), $('#putOrderNumber').val(), $('#putPrice').val(),
                         $('#putOrderDate').val(), $('#putUser').val())">
                        Add
                    </button>
                </form>
            </td>
        </tr>
        <tr>
            <td>Update order</td>
            <td><code><strong>POST</strong>/order/update</code></td>
            <td>
                <form class="form-inline">
                    Id: <input type="number" id="postId" value="">
                    Person: <input type="text" id="postPerson" value="Student">
                    Product: <input type="text" id="postProduct" value="glass of water">
                    Order Number: <input type="text" id="postOrderNumber" value="37">
                    Price: <input type="text" id="postPrice" value="37.37">
                    Order Date: <input type="text" id="postOrderDate" value="2017-11-01">
                    User id: <input type="text" id="postUser" value="2">
                    <button type="button"
                            onclick="RestPost($('#postId').val(),$('#postPerson').val(), $('#postProduct').val(), $('#postOrderNumber').val(),
                         $('#postPrice').val(), $('#postOrderDate').val(), $('#postUser').val())">
                        Update
                    </button>
                </form>
            </td>
        </tr>
        <tr>
            <td>Delete order by ID</td>
            <td><code><strong>DELETE</strong>/order/delete/{id}</code></td>
            <td>
                Id: <input id="OrderIdForDelete" value=""/>
                <button type="button" onclick="RestDelete($('#OrderIdForDelete').val())">Delete</button>
            </td>
        </tr>
    </table>

    <div class="panel panel-default" id="response">
        <div class="panel-heading">
            <strong>RESPONSE</strong>
        </div>
    </div>
</div>