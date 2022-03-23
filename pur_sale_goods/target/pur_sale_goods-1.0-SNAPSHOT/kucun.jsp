<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/3
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>goodsXinxi</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js" type="text/javascript"
    ></script>
    <link rel="stylesheet" href="css/customer.css" type="text/css">
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>

        function updatesaleprice(goodid) {
            var saleprice = prompt("请在提示框中输入你需要设置的单价： ", "");
            if (saleprice != null) {
                location.href = "/updatesalepriceServlet?saleprice=" + saleprice + "&goodid=" + goodid;
            }
        };
        $(function () {
            $("#search").click(function () {
                var searchgoods = $("#searchgoods").val();
                var patt = new RegExp(searchgoods);
                var allgoods = $(".goods");
                allgoods.each(function () {
                    var goodsxx = $(this).children('td');
                    goodsxx.each(function () {
                        $(this).parent().hide();
                        if (searchgoods != "") {
                            if ($(this).text().indexOf(searchgoods) != -1) {
                                $(this).parent().show();
                                return false;
                            }
                        } else {
                            $(this).parent().show();
                        }
                    })

                    // alert($(this).children('p').text());
                })
            });
            $("#searchtime").click(function () {
                var starttime = $("#starttime").val();
                var endtime = $("#endtime").val();
                if (starttime != null && endtime != null) {

                    window.location.href = "/findBytimeServlet?starttime=" + starttime + "&endtime=" + endtime;
                }

            });

        });

    </script>

</head>
<body>
<!--  1.页眉部分-->
<header class="container-fluid">
    <div class="row paddtop">
        <div class="col-md-3">
            <img src="images/schoolname.jpg" class="img-responsive">
        </div>
        <div class="col-md-5">
            <form id="searchform">

                <input type="text" id="searchgoods" name="searchgoods" class="search-input" placeholder="请输入需要搜索的建材信息">
                <a id="search" href="#" class="search-btn">搜索</a>
            </form>
        </div>
        <div class="col-md-4 phone">
            <img src="images/hotel_tel.png" class="img-responsive">
        </div>

    </div>
    <div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">主页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="/managergoodsServlet">采购商品 </a></li>
                        <li class="active"><a href="/kucunServlet">库存管理</a></li>
                        <li><a href="/findCustomerxinxiServlet">用户管理</a></li>
                        <li><a href="login.jsp">退出登录</a></li>
                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
</header>
<!-- 2.主体部分-->
<div class="container">
    <h3 style="text-align: center">库存信息管理</h3>
    <div>
        <form class="form-inline">
            <div class="form-group">
                <label for="starttime">起始时间</label>
                <input type="text" class="form-control" id="starttime" placeholder="2022-1-1 12:00:00">
            </div>
            <div class="form-group">
                <label for="endtime">结束时间</label>
                <input type="text" class="form-control" id="endtime" placeholder="2022-1-2 12:00:00">
            </div>
            <a id="searchtime" class="btn btn-primary">查询</a>
        </form>
    </div>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>编号</th>
            <th>类型</th>
            <th>进价</th>
            <th>单价</th>
            <th>数量</th>
            <th>最近修改日期</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${goods}" var="goods" varStatus="s">
            <tr class="goods">
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td>${goods.purprice}</td>
                <td>${goods.saleprice}</td>
                <td>${goods.count}</td>
                <td>${goods.data}</td>
                <td><a class="btn btn-default btn-sm"
                       href="javascript:updatesaleprice(${goods.id})">修改单价</a>
                </td>
            </tr>
        </c:forEach>


    </table>

</div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row school" style="background-color: white">
        山东省青岛市黄岛区祥荷有限公司
    </div>
</footer>
</body>
</html>
