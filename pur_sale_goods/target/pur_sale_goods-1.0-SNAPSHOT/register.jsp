<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/12/31
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <style>
        .rg_layout {
            width: 100%;
            height: 585px;
            background: url(./images/register.jpg) no-repeat center;
            background-size: cover;
            overflow: hidden;
        }

        .rg_layout .rg_form {
            width: 886px;
            height: 534px;
            background-color: #fff;
            margin: 24px auto;
            border: 8px solid #eeeeee;
            box-sizing: border-box;
        }

        .rg_layout .rg_form > .rg_form_left {
            width: 256px;
            float: left;
            padding-top: 20px;
            padding-left: 20px;
            box-sizing: border-box;
        }

        .rg_layout .rg_form > .rg_form_center {
            width: 358px;
            float: left;
            padding-top: 10px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .rg_layout .rg_form > .rg_form_right {
            width: 256px;
            float: right;
        }

        .rg_form > .rg_form_left > p:first-child {
            font-size: 20px;
            color: #ffcd26;

        }

        .rg_form > .rg_form_left > p:last-child {
            font-size: 20px;
            color: #a6a6a6;
        }

        .rg_form > .rg_form_center .td_left {
            width: 65px;
            text-align: right;
        }

        .rg_form > .rg_form_center table {
            vertical-align: top;
        }

        .rg_form > .rg_form_center table tr {
            height: 50px;
        }

        .rg_form > .rg_form_center .td_right {
            width: 293px;
        }

        .rg_form_center .td_right > input[type="text"], .rg_form_center .td_right > input[type="date"] {
            width: 256px;
            height: 32px;
            line-height: 32px;
            box-sizing: border-box;
            padding: 6px 12px;
            border-radius: 4px;
            border: 1px solid #a6a6a6;
            float: right;
        }

        .rg_form > .rg_form_center .td_right.gender {
            padding-left: 40px;
            box-sizing: border-box;
        }

        .rg_form > .rg_form_center .td_right.check {
            padding-left: 36px;
            box-sizing: border-box;
        }

        .rg_form > .rg_form_center .td_right > .check {
            width: 118px;
            float: left;
            margin-right: 14px;
        }

        .rg_form > .rg_form_center .td_right > .submit {
            width: 120px;
            height: 36px;
            line-height: 36px;
            background-color: #ffc900;
            font-size: 14px;
        }

        .rg_form > .rg_form_right > p {
            float: right;
            font-size: 14px;
            padding: 20px 12px 0 0;
            box-sizing: border-box;
        }

        .rg_form > .rg_form_right > p > a {
            color: #fc8989;
        }
    </style>
    <!--导入jquery-->
    <script src="js/jquery-3.3.1.js"></script>

    <script>
        /*
        表单校验：
            1.用户名：单词字符，长度1到5位
            2.密码：单词字符，长度1到20位
            3.email：邮件格式
            4.姓名：非空
            5.性别：非空
            6.验证码：非空
		*/

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

        //校验邮箱
        function checkEmail() {
            var email = $("#email").val();
            // 定义邮箱的正则。 itcast@163.com || 17792035609@163.com
            // 比较(X)和(?:X)，前者是捕获分组，后者不捕获，
            // 区别在于正则表达式匹配输入字符串之后所获得的匹配的（数）组当中没有(?:X)匹配的部分
            var reg_email = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
            var flag = reg_email.test(email);

            if (flag) {
                $("#email").css("border", "");
            } else {
                $("#email").css("border", "1px solid red");
            }

            return flag;
        }

        //校验姓名
        function checkName() {
            var name = $("#name").val();
            // \uxxxx:查找以十六进制数 xxxx 规定的 Unicode 字符。
            var reg_name = /^[\u4E00-\u9FA5A-Za-z\s]+(·[\u4E00-\u9FA5A-Za-z]+)*$/;
            var flag = reg_name.test(name);

            if (flag) {
                $("#name").css("border", "");
            } else {
                $("#name").css("border", "1px solid red");
            }

            return flag;
        }


        // 校验验证码
        function checkCheck() {
            var check = $("#check").val();

            if (!check) {
                $("#check").css("border", "1px solid red");
                return false;
            } else {
                $("#check").css("border", "");
                return true;
            }
        }

        //bom后
        $(function () {
            //表单提交时，调用所有校验方法
            $("#registerForm").submit(function () {
                if (checkUserid() && checkPassword() && checkEmail() && checkName()
                    && checkCheck()) {
                    // 校验通过,发送ajax请求，提交表单的数据
                    $.post("registUserServlet", $(this).serialize(), function (data) {
                        // 处理服务器响应的数据  data  {flag:true,errorMsg:"注册失败"}
                        if (data.flag) {
                            // 注册成功，跳转到register_ok.html页面
                            location.href = "../registerok.jsp";
                        } else {

                            // 注册失败
                            document.getElementById("checkimg").src = "checkCode?" + new Date().getTime();
                            $("#errorMsg").html(data.errorMsg);

                        }
                    });
                }

                //2.不让页面跳转
                return false;
                //如果这个方法没有返回值，或者返回为true，则表单提交，如果返回为false，则表单不提交
            });

            //当某一个组件失去焦点是，调用对应的校验方法
            $("#uid").blur(checkUserid);
            $("#password").blur(checkPassword);
            $("#email").blur(checkEmail);
            $("#name").blur(checkName);
            $("#check").blur(checkCheck);
        });
    </script>

</head>
<body>

<div class="rg_layout">
    <div class="rg_form clearfix">
        <div class="rg_form_left">
            <p>新用户注册</p>
            <p>USER REGISTER</p>
        </div>
        <div class="rg_form_center">

            <!--注册表单-->
            <form id="registerForm">
                <!--提交处理请求的标识符-->
                <input type="hidden" name="action" value="register">
                <table style="margin-top: 25px;">
                    <!--         id-->
                    <tr>
                        <td class="td_left">
                            <label for="uid">用户名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="uid" name="uid" placeholder="请输入账号">
                        </td>
                    </tr>
                    <!--                    密码-->
                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="password" name="password" placeholder="请输入密码">
                        </td>
                    </tr>
                    <!--                    email-->
                    <tr>
                        <td class="td_left">
                            <label for="email">Email</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="email" name="email" placeholder="请输入Email">
                        </td>
                    </tr>
                    <!--                    姓名-->
                    <tr>
                        <td class="td_left">
                            <label for="name">姓名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="name" name="name" placeholder="请输入真实姓名">
                        </td>
                    </tr>
                    <!--                   性别-->
                    <tr>
                        <td class="td_left">
                            <label for="sex">性别</label>
                        </td>
                        <td class="td_right gender">
                            <input type="radio" id="sex" name="sex" value="男" checked> 男
                            <input type="radio" name="sex" value="女"> 女
                        </td>
                    </tr>
                    <!--                    验证码-->
                    <tr>
                        <td class="td_left">
                            <label for="check">验证码</label>
                        </td>
                        <td class="td_right check">
                            <input type="text" id="check" name="check" class="check">
                            <img src="checkCode" height="32px" id="checkimg" alt="" onclick="changeCheckCode(this)">
                            <script type="text/javascript">
                                //图片点击事件
                                function changeCheckCode(img) {
                                    img.src = "checkCode?" + new Date().getTime();
                                }
                            </script>
                            <div id="errorMsg" style="color: red"></div>
                        </td>
                    </tr>
                    <!--                    注册-->
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right check">
                            <input type="submit" class="submit" value="注册" style="border-radius:5px">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="rg_form_right">
            <p>
                已有账号？
                <a href="login.jsp">立即登录</a>
            </p>
        </div>
    </div>
</div>
<!--引入尾部-->
<div id="footer"></div>
<!--导入布局js，共享header和footer-->
<script type="text/javascript" src="js/include.js"></script>

</body>
</html>
