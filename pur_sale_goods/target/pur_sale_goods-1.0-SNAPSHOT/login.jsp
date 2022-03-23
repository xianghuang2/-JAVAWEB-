<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/1
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>


    <script>
        //校验用户名
        //单词字符，长度8到20位
        function checkUserid() {
            //1.获取用户名值
            var userid = $("#uid").val();
            //定义正则，注意，{1,5}中间没空格
            var reg_username = /^\d{1,5}$/;
            //判断正则，并给出提示信息
            var flag = reg_username.test(userid);

            if (flag) {
                //用户名合法
                $("#uid").css("border", "");
            } else {
                //用户名非法
                $("#uid").css("border", "1px solid red");
            }
            return flag;
        }

        //校验密码
        function checkPassword() {
            //1.获取密码
            var password = $("#password").val();
            //定义正则，注意，{1,20}中间没空格
            var reg_password = /^\w{1,20}$/;
            //判断正则，并给出提示信息
            var flag = reg_password.test(password);

            if (flag) {
                //密码合法
                $("#password").css("border", "");
            } else {
                //密码非法
                $("#password").css("border", "1px solid red");
            }

            return flag;
        }

        //bom后
        $(function () {
            //表单提交时，调用所有校验方法
            $("#loginform").submit(function () {
                if (checkUserid() && checkPassword()) {
                    $.post("loginServlet", $(this).serialize(), function (data) {
                        if (data.flag) {
                            // 登录成功，跳转到login_ok.html页面
                            if ($(document.querySelector("input[name='leibie']:checked")).val() == "customer") {

                                location.href = "/customergoodsServlet?name=" + data.errorMsg;
                            } else if ($(document.querySelector("input[name='leibie']:checked")).val() == "manager") {

                                location.href = "/managergoodsServlet?name=" + data.errorMsg;
                            }


                        } else {
                            $("#errorMsg").html("用户名或密码错误");
                        }
                    });
                } else if (checkUserid()) {
                    $("#errorMsg").html("密码非法");
                } else if (checkPassword()) {
                    $("#errorMsg").html("账号非法");
                }

                return false;
            });

            $("#uid").blur(checkUserid);
            $("#password").blur(checkPassword);
        });
    </script>
    <title>Login</title>
    <style>

        body {
            margin: 0px;
            padding: 0px;
            font-family: sans-serif;
            background: url(./images/login.jpg);
            background-size: cover;
        }

        .box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            /*实现块元素百分比下居中*/
            width: 450px;
            padding: 50px;
            background: rgba(0, 0, 0, .8);
            box-sizing: border-box;
            box-shadow: 0px 15px 25px rgba(0, 0, 0, .5);
            border-radius: 15px;
        }

        .box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }

        .box .inputbox {
            position: relative;
        }

        .box .inputbox input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .box .inputbox label {
            position: absolute;
            top: 0px;
            left: 0px;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }

        .box .inputbox input:focus ~ label,
        .box .inputbox input:valid ~ label {
            top: -18px;
            left: 0;
            color: #03a9f4;
            font-size: 14px;
        }

        .box input[type="submit"] {
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
            background: #03a9f4;
            padding: 15px 20px;
            cursor: pointer;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Backgrounds -->

<div class="box" id="ad">
    <h2>建材物资系统</h2>

    <form id="loginform">
        <div class="inputbox">
            <input type="number" name="uid" id="uid" required="">
            <label>Username</label>
        </div>
        <div class="inputbox">
            <input type="password" name="password" id="password" required="">
            <label>Password</label>
        </div>
        <p style="color: #fff;">
            <label for="nan"></label>
            <input type="radio" id="nan" name="leibie" value="customer" checked> 顾客
            <input type="radio" name="leibie" value="manager"> 管理员
            &nbsp &nbsp&nbsp&nbsp&nbsp没有账号？
            <a href="register.jsp" style="color: red">立即注册</a>

        <p>

            <input type="submit" name="" value="submit" style="margin-left:120px">
        <div id="errorMsg" style="color: red;margin-left:100px"></div>
    </form>
</div>
</body>


</body>
</html>
