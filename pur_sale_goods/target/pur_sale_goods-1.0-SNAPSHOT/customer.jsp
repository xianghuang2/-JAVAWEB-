<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/1
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>顾客购买</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js" type="text/javascript"
    ></script>
    <link rel="stylesheet" href="css/customer.css" type="text/css">
    <script>
        $(function () {
            $("#name").text("欢迎您!${request.getSession().getAttribute("cname")}");
            <c:forEach items="${goods}" var="good" varStatus="s">
            <c:if test="${good.name=='木材'}">
            $("#mucai").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='钢铁'}">
            $("#gangtie").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='玻璃'}">
            $("#boli").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='铝合金'}">
            $("#lvhejin").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='树脂'}">
            $("#shuz").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='防腐木'}">
            $("#fangfumv").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='混泥土'}">
            $("#hunnitu").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='胶水'}">
            $("#jiaoshui").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='塑料板'}">
            $("#lvsuoban").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>
            <c:if test="${good.name=='竹子纤维'}">
            $("#xianwei").text("${good.saleprice}元\xa0\xa0\xa0\xa0\xa0\xa0最后${good.count}件!!!");
            </c:if>

            </c:forEach>

            $("#search").click(function () {
                var searchgoods = $("#searchgoods").val();
                // alert(searchgoods);
                var patt = new RegExp(searchgoods);
                var allgoods = $(".thumbnail");
                allgoods.each(function () {
                    if (searchgoods != "") {
                        if (patt.test($(this).children('p').text())) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    } else {
                        $(this).show();
                    }
                    // alert($(this).children('p').text());
                })

            });
            $(".thumbnail").click(function () {

                var id = $(this).children("p").text();
                var goodsname = $(this).children("font").attr("id");
                var num = prompt("你选择的商品是: " + id, "请在此输入您需要购买的数量");
                if (num != null) {
                    /*location.href = "/login.jsp";*/
                    location.href = "/saleServlet?id=" + goodsname + "&num=" + num + "&cid=1";
                }
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

                <input type="text" id="searchgoods" name="searchgoods" class="search-input" placeholder="请输入需要购买的建材">
                <a id="search" href="#" class="search-btn">搜索</a>
            </form>
        </div>
        <div class="col-md-4 phone">
            <h2 id="name" style="color: red">欢迎您！***</h2>
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
                        <li class="active"><a href="/customergoodsServlet">所有商品 <span
                                class="sr-only">(current)</span></a></li>
                        <li><a href="/findManagerxinxiServlet">联系客服</a></li>
                        <li><a href="login.jsp">退出登录</a></li>
                    </ul>


                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="1000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/1.jpg" alt="...">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="images/2.jpg" alt="...">
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="item">
                    <img src="images/3.jpg" alt="...">
                    <div class="carousel-caption">

                    </div>
                </div>
                ...
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</header>
<!-- 2.主体部分-->
<div class="container">
    <div class="row betterchoose">
        <img src="images/icon.jpg">
        <span>所有商品</span>
    </div>
    <div class="row paddtop">
        <div class="col-md-3 thumbnail">
            <img src="images/mucai.jpg" href="">
            <p>户外防腐木木板碳化木地板实木护墙板葡萄架吊顶龙骨木头条木方板材</p>
            <font color="red" id="mucai">35元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/gangtie.jpg">
            <p>304不锈钢铁六角棒 316L六角钢棒 圆棒 六边形棒 光亮棒 实心六方</p>
            <font color="red" id="gangtie">55元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/boli.jpg">
            <p>透明塑料板有机玻璃板亚克力板1mm 2mm3mm订做零切雕刻自选尺寸</p>
            <font color="red" id="boli">65元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/lvhejin.jpg">
            <p>TDT欧标铝型材4040口罩机架工业diy框架工作台支架铝合金型材国标</p>
            <font color="red" id="lvhejin">55元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/shuz.jpg">
            <p>水绿色FR4环氧玻璃纤维板3240环氧板加工黑色G10玻纤板环氧树脂棒</p>
            <font color="red" id="shuz">16元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/fangfumv.jpg">
            <p>户外防腐木地板花园碳化木实木龙骨板材门头木方护墙板庭院葡萄架</p>
            <font color="red" id="fangfumv">70元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/hunnitu.jpg">
            <p>轻集料混凝土LC7.5型LC5.0型轻骨料干拌复合轻质泡沫找坡垫层填充</p>
            <font color="red" id="hunnitu">55元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/jiaoshui.jpg">
            <p>蓝田 502胶强力胶万能胶透明胶水粘塑料金属陶瓷亚克力木头玻璃铁家具专用多功能粘得牢快干油性胶电焊焊接胶</p>
            <font color="red" id="jiaoshui">4元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/lvsuoban.jpg">
            <p>正宗上海吉祥 铝塑板4mm室外门头招牌广告背景墙吊顶铝朔复合板材</p>
            <font color="red" id="lvsuoban">12元</font>
        </div>
        <div class="col-md-3 thumbnail">
            <img src="images/xianwei.jpg">
            <p>竹木纤维集成墙板护墙板装饰板木饰面板快装墙面实心竹炭装修材料</p>
            <font color="red" id="xianwei">43元</font>
        </div>

    </div>

</div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row">
        <img src="images/footer_service.png" class="img-responsive">
    </div>
    <div class="row school">
        山东省青岛市黄岛区祥荷有限公司
    </div>
</footer>
</body>

</html>