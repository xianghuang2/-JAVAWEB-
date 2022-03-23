<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/1
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>CustomerUserXinxi</title>

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
        function deleteUser(id) {
            if (confirm("您确定要删除吗？")) {

                location.href = "/deleteUserServlet?id=" + id;
            }

        }

        $(function () {
            $("#search").click(function () {
                var searchuser = $("#searchuser").val();
                var patt = new RegExp(searchuser);
                var alluser = $(".userxinxi");
                alluser.each(function () {
                    var userxx = $(this).children('td');
                    userxx.each(function () {
                        $(this).parent().hide();
                        if (searchuser != "") {
                            if ($(this).text().indexOf(searchuser) != -1) {
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

        })

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

                <input type="text" id="searchuser" name="searchuser" class="search-input" placeholder="请输入需要搜索的信息">
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
                        <li><a href="/managergoodsServlet">采购商品</a></li>
                        <li><a href="/kucunServlet">库存管理</a></li>
                        <li class="active"><a href="/findCustomerxinxiServlet">用户管理</a></li>
                        <li><a href="login.jsp">退出登录</a></li>
                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
</header>
<!-- 2.主体部分-->
<div class="container">
    <h3 style="text-align: center">用户信息</h3>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>序号</th>
            <th>编号</th>
            <th>密码</th>
            <th>姓名</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${customerxinxi}" var="custonmerxinxi" varStatus="s">
            <tr class="userxinxi">
                <td>${s.count}</td>
                <td>${custonmerxinxi.id}</td>
                <td>${custonmerxinxi.password}</td>
                <td>${custonmerxinxi.name}</td>
                <td>${custonmerxinxi.sex}</td>
                <td>${custonmerxinxi.email}</td>
                <td><a class="btn btn-default btn-sm"
                       href="javascript:deleteUser(${custonmerxinxi.id})">删除</a>
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
