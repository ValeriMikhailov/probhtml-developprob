<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib tagdir="/WEB-INF/tags/block" prefix="block" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AJAX based CRUD operations using jTable in Servlet and JSP</title>

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>--%>

    <!-- Include one of jTable styles. -->
    <%--<link href="static/css/metro/crimson/jtable.css" rel="stylesheet" type="text/css"/>--%>
    <link href="static/dark/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

    <!-- Include jTable script file. -->
    <script src="static/dark/external/jquery/jquery.js" type="text/javascript"></script>
    <script src="static/dark/jquery-ui.js" type="text/javascript"></script>
    <script src="static/js/js/jtable.2.4.0/jquery.jtable.min.js" type="text/javascript"></script>
    <style>
        body {
            font-family: "Trebuchet MS", sans-serif;
            margin: 50px;
        }

        .demoHeaders {
            margin-top: 2em;
        }

        #dialog-link {
            padding: .4em 1em .4em 20px;
            text-decoration: none;
            position: relative;
        }

        #dialog-link span.ui-icon {
            margin: 0 5px 0 0;
            position: absolute;
            left: .2em;
            top: 50%;
            margin-top: -8px;
        }

        #icons {
            margin: 0;
            padding: 0;
        }

        #icons li {
            margin: 2px;
            position: relative;
            padding: 4px 0;
            cursor: pointer;
            float: left;
            list-style: none;
        }

        #icons span.ui-icon {
            float: left;
            margin: 0 4px;
        }

        .fakewindowcontain .ui-widget-overlay {
            position: absolute;
        }

        select {
            width: 200px;
        }
    </style>
</head>
<body>
<div style="width:60%;margin-right:20%;margin-left:20%;text-align:center;">
    <%--<div class="container" style="width:60%;margin-right:20%;margin-left:20%;text-align:center;">--%>
    <h1>AJAX based CRUD operations in Java Web Application using jquery jTable plugin</h1>
    <block:left/>
    <div id="PersonTableContainer"></div>

    <%--<table class="table">--%>
    <%--<tr>--%>
    <%--<td>GET All Orders</td>--%>
    <%--<td><code><strong>GET ALL</strong>/order/all</code></td>--%>
    <%--<td>--%>
    <%--<button type="button" onclick="RestGetAll()">All</button>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</table>--%>
    <%--<div class="panel panel-default" id="response" style="font-size: 16px">--%>
    <%--<div class="panel-heading">--%>
    <%--<strong>RESPONSE</strong>--%>
    <%--</div>--%>
    <%--</div>--%>
</div>

<script type="text/javascript">

    $(document).ready(function () {
        $('#PersonTableContainer').jtable({
            title: 'Table of people',
            paging: true,
            pageSize: 10,
            sorting: true,
            defaultSorting: 'name ASC',
            actions: {
                listAction: '/order/all',
                // listAction: 'OrderController?action=list',
                createAction: 'OrderController?action=create',
                updateAction: 'OrderController?action=update',
                deleteAction: 'OrderController?action=delete'
            },
            fields: {
                id: {
                    title: 'S.NO',
                    key: true,
                    list: true,
                    create: true
                },
                person: {
                    title: 'Person',
                    width: '30%',
                    edit: false
                },
                product: {
                    title: 'Product',
                    width: '30%',
                    edit: true
                },
                price: {
                    title: 'Price',
                    width: '20%',
                    edit: true
                }
            }
        });

        $('#PersonTableContainer').jtable('load');
    });
</script>
<%--<script type="text/javascript" src="static/js/order.js"></script>--%>
</body>
</html>