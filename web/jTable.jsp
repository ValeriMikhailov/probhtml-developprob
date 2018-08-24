<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib tagdir="/WEB-INF/tags/block" prefix="block" %>
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AJAX based CRUD operations using jTable in Servlet and JSP</title>
    <!-- Include one of jTable styles. -->
    <link href="static/css/metro/darkgray/jtable.css" rel="stylesheet" type="text/css"/>
    <%--<link href="static/css/metro/crimson/jtable.css" rel="stylesheet" type="text/css"/>--%>
    <link href="static/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css"/>
    <!-- Include jTable script file. -->
    <script src="static/js/js/jquery-2.1.4.js" type="text/javascript"></script>
    <%--<script src="static/js/js/jquery-1.8.2.js" type="text/javascript"></script>--%>
    <script src="static/js/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script src="static/js/js/jtable.2.4.0/jquery.jtable.js" type="text/javascript"></script>
</head>
<body>
<div style="width:60%;margin-right:20%;margin-left:20%;text-align:center;">
    <h1>AJAX based CRUD operations in Java Web Application using jquery jTable plugin</h1>
    <block:left/>
    <div id="PersonTableContainer"></div>
</div>

<%--<script type="text/javascript">--%>
    <%--$('#PersonTableContainer').jtable({--%>
        <%--actions: {--%>
            <%--listAction: function (postData) {--%>
                <%--return $.Deferred(function ($dfd) {--%>
                    <%--$.ajax({--%>
                        <%--url: '/users/all',--%>
                        <%--type: 'POST',--%>
                        <%--data: postData,--%>
                        <%--success: function (data) {--%>
                            <%--$dfd.resolve(data);--%>
                            <%--console.log("loading")--%>
                        <%--},--%>
                    <%--});--%>
                <%--});--%>
            <%--}--%>
        <%--},--%>
        <%--fields:{--%>
            <%--accountName: {--%>
                <%--title: 'Acc Name',--%>
                <%--list: true--%>
            <%--}--%>
        <%--}--%>
    <%--});--%>
<%--</script>--%>

<script>
    // $(document).ready(function () {
    $('#PersonTableContainer').jtable({
// let PersonTable =
//     {
        title: 'Table of people',
        actions: {
            listAction: 'users/all'
        },
        fields: {
// id: {
//     title: 'S.NO',
//     key: true,
//     list: false,
//     create: false
// },
// person: {
//     title: 'Person',
//     width: '10%',
//     edit: false
// },
// product: {
//     title: 'Product',
//     width: '10%',
//     edit: true
// },
// orderNumber: {
//     title: 'Order Number',
//     width: '10%',
//     edit: true
// },
// price: {
//     title: 'Price',
//     width: '10%',
//     edit: true
// },
// orderDate: {
//     title: 'Date',
//     width: '10%',
//     edit: true
// },
// user_id: {
//     title: 'UserID',
//     key: true,
//     list: true
// },

// user: {
            accountName: {
                title: 'Acc Name',
                width: '10%'
            },
            email: {
                title: 'Email',
                width: '10%'
            },
            firstName: {
                title: 'F Name',
                width: '5%'
            },
            id: {
                title: 'id',
                key: true,
                list: true
            },
            lastName: {
                title: 'L Name',
                width: '5%'
            },
            password: {
                title: 'Password',
                width: '5%'
            }
// }
        }
    });
    // $('#PersonTableContainer').jtable(PersonTable);
    $('#PersonTableContainer').jtable('load');

    // });
</script>

</body>
</html>