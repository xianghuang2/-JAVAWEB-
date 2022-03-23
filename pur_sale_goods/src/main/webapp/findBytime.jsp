<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/1/3
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>建材信息详询</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js" type="text/javascript"
    ></script>
    <script src="js/echarts.min.js" type="text/javascript"
    ></script>
    <script src="js/flexible.js" type="text/javascript"
    ></script>
    <script src="js/china.js" type="text/javascript"
    ></script>
    <script src="js/include.js" type="text/javascript"
    ></script>


</head>
<body>
<header>
    <h1>建材信息详询</h1>
    <div class="showTime"></div>
    <script>
        var t = null;
        var purcountsum = 0;
        var salecountsum = 0;
        var goodsname = new Array(10);
        var purcount = new Array(10);
        var salecount = new Array(10);
        var puroff = new Array(10);
        var saleincome = new Array(10);
        var income = new Array(10);
        t = setTimeout(time, 1000); //開始运行
        function time() {
            clearTimeout(t); //清除定时器
            dt = new Date();
            var y = dt.getFullYear();
            var mt = dt.getMonth() + 1;
            var day = dt.getDate();
            var h = dt.getHours(); //获取时
            var m = dt.getMinutes(); //获取分
            var s = dt.getSeconds(); //获取秒
            document.querySelector(".showTime").innerHTML =
                "当前时间：" +
                y +
                "年" +
                mt +
                "月" +
                day +
                "-" +
                h +
                "时" +
                m +
                "分" +
                s +
                "秒";
            t = setTimeout(time, 1000); //设定定时器，循环运行
        }

        $(function () {
            var mychart = echarts.init(document.querySelector
            (".bar1 .chart"));


            var sum = purcountsum;
            var bili = Array(10);
            for (var i = 0; i < 10; i++) {
                bili[i] = (purcount[i] / sum * 100).toFixed(1);
                if (purcount[i] == 0) {
                    bili[i] = null;
                }
            }
            var mycolor = ["#1089E7", "#F57474", "#56D0E3",
                "#F8B448", "#8B78F6", "#D9E2E2", "#041919", "#7145D8",
                "#4C45D8", "#D84587"];
            var option = {
                grid: {
                    left: '22%',
                    top: '10%',
                    bottom: '10%',
                    // containLabel: true
                },
                xAxis: {
                    type: 'value',
                    show: false,
                },
                yAxis: [{
                    type: 'category',
                    inverse: true,
                    data: goodsname,
                    axisLine: {
                        show: false
                    },
                    //不显示刻度
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        color: "#fff",
                        fontSize: 10
                    }
                },
                    {
                        type: 'category',
                        inverse: true,
                        data: purcount,
                        axisLine: {
                            show: false
                        },
                        //不显示刻度
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            color: "#fff",
                            fontSize: 10
                        }
                    },
                ],
                series: [
                    {
                        name: '条',
                        type: 'bar',
                        itemStyle: {
                            barBorderRadius: 20,
                            //此时的color可以修改柱子颜色
                            color: function (params) {
                                return mycolor[params.dataIndex];
                            }
                        },
                        //柱子间距离
                        barCategoryGap: 50,
                        //柱子宽度
                        barWidth: 10,
                        //显示柱子内文字
                        label: {
                            show: true,
                            position: "inside",
                            //{c}c会自动获取柱子内数据
                            formatter: "{c}%",


                        },
                        data: bili,
                        yAxisIndex: 0,
                    },
                    {
                        name: '框',
                        type: 'bar',
                        //柱子间距离
                        barCategoryGap: 50,
                        //柱子宽度
                        barWidth: 10,

                        data: [100, 100, 100, 100, 100, 100, 100, 100, 100, 100],
                        itemStyle: {
                            barBorderRadius: 15,
                            //此时的color可以修改柱子颜色
                            color: "none",
                            borderColor: "#00c1de",
                            borderWidth: 3,
                        },
                        yAxisIndex: 1,
                    }
                ]
            };
            mychart.setOption(option);
            window.addEventListener('resize', function () {
                mychart.resize();
            })

        })
        $(function () {
            var mychart = echarts.init(document.querySelector
            (".bar2 .chart"));


            var sum = salecountsum;
            var bili = Array(10);
            for (var i = 0; i < 10; i++) {
                bili[i] = (salecount[i] / sum * 100).toFixed(1);
                if (salecount[i] == 0) {
                    bili[i] = null;
                }
            }
            var mycolor = ["#1089E7", "#F57474", "#56D0E3",
                "#F8B448", "#8B78F6", "#D9E2E2", "#041919", "#7145D8",
                "#4C45D8", "#D84587"];
            var option = {
                grid: {
                    left: '22%',
                    top: '10%',
                    bottom: '10%',
                    // containLabel: true
                },
                xAxis: {
                    type: 'value',
                    show: false,
                },
                yAxis: [{
                    type: 'category',
                    inverse: true,
                    data: goodsname,
                    axisLine: {
                        show: false
                    },
                    //不显示刻度
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        color: "#fff",
                        fontSize: 10
                    }
                },
                    {
                        type: 'category',
                        inverse: true,
                        data: salecount,
                        axisLine: {
                            show: false
                        },
                        //不显示刻度
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            color: "#fff",
                            fontSize: 10
                        }
                    },
                ],
                series: [
                    {
                        name: '条',
                        type: 'bar',
                        itemStyle: {
                            barBorderRadius: 20,
                            //此时的color可以修改柱子颜色
                            color: function (params) {
                                return mycolor[params.dataIndex];
                            }
                        },
                        //柱子间距离
                        barCategoryGap: 50,
                        //柱子宽度
                        barWidth: 10,
                        //显示柱子内文字
                        label: {
                            show: true,
                            position: "inside",
                            //{c}c会自动获取柱子内数据
                            formatter: "{c}%",


                        },
                        data: bili,
                        yAxisIndex: 0,
                    },
                    {
                        name: '框',
                        type: 'bar',
                        //柱子间距离
                        barCategoryGap: 50,
                        //柱子宽度
                        barWidth: 10,

                        data: [100, 100, 100, 100, 100, 100, 100, 100, 100, 100],
                        itemStyle: {
                            barBorderRadius: 15,
                            //此时的color可以修改柱子颜色
                            color: "none",
                            borderColor: "#00c1de",
                            borderWidth: 3,
                        },
                        yAxisIndex: 1,
                    }
                ]
            };
            mychart.setOption(option);
            window.addEventListener('resize', function () {
                mychart.resize();
            })

        })
        $(function () {

            var mychart = echarts.init(document.querySelector
            (".line1 .chart"));
            var option = {
                tooltip: {
                    trigger: 'axis',
                },
                legend: {
                    textStyle: {
                        color: "rgba(255,255,255,0.5)",
                        fontSize: 12
                    },
                    top: 0
                },
                grid: {
                    left: 10,
                    right: 10,
                    bottom: 10,
                    top: 30,
                    containLabel: true
                },
                xAxis: [
                    {
                        axisLabel: {
                            interval: 0,
                            textStyle: {
                                color: "rgba(255,255,255,0.6)",
                                fontSize: 6
                            }
                        },
                        axisLine: {
                            lineStyle: {
                                color: "rgba(255,255,255,0.2)"
                            }
                        },
                        type: 'category',
                        boundaryGap: false,
                        data: goodsname
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            textStyle: {
                                color: "#4c9bfd",
                                fontSize: 12
                            },
                            axisLine: {
                                lineStyle: {
                                    color: "rgba(255,25,255,0.1)",
                                }
                            },
                            splitLine: {
                                lineStyle: {
                                    color: "rgba(255,25,255,0.1)"
                                }
                            }
                        }
                    }
                ],
                series: [
                    {
                        smooth: true,
                        name: '采购花销',
                        type: 'line',
                        areaStyle: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1, [
                                    {
                                        offset: 0,
                                        color: "rgba(1,132,213,0.4)"
                                    },
                                    {
                                        offset: 0.8,
                                        color: "rgba(1,132,213,0.1)"
                                    }
                                ], false
                            ),
                            shadowColor: "rgba(0,0,0,0.1)"
                        },
                        //设置拐点
                        symbol: "circle",
                        symbolSize: 8,
                        //设置拐点样式
                        showSymbol: false,
                        itemStyle: {
                            color: "#0184d5",
                            borderColor: "rgba(221,220,107,0.1)",
                            borderWidth: 8
                        },
                        lineStyle: {
                            color: "#0184d5",
                            width: 2
                        },
                        data: puroff
                    },
                    {
                        smooth: true,
                        name: '交易额',
                        type: 'line',
                        lineStyle: {
                            color: "#00d887",
                            width: 2
                        },
                        areaStyle: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1, [
                                    {
                                        offset: 0,
                                        color: "rgba(0,216,135,0.4)"
                                    },
                                    {
                                        offset: 0.8,
                                        color: "rgba(0,216,135,0.1)"
                                    }
                                ], false
                            ),
                            shadowColor: "rgba(0,0,0,0.1)"
                        },
                        symbol: "circle",
                        symbolSize: 5,
                        showSymbol: false,
                        itemStyle: {
                            color: "#00d887",
                            borderColor: "rgba(221,220,107,0.1)",
                            borderWidth: 8
                        },
                        data: saleincome
                    },
                    {
                        smooth: true,
                        name: '净利润',
                        type: 'line',
                        lineStyle: {
                            color: "#ff0000",
                            width: 2
                        },
                        areaStyle: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1, [
                                    {
                                        offset: 0,
                                        color: "rgba(255,0,0,0.4)"
                                    },
                                    {
                                        offset: 0.8,
                                        color: "rgba(255,0,0,0.1)"
                                    }
                                ], false
                            ),
                            shadowColor: "rgba(0,0,0,0.1)"
                        },
                        symbol: "circle",
                        symbolSize: 5,
                        showSymbol: false,
                        itemStyle: {
                            color: "#ff0000",
                            borderColor: "rgba(221,220,107,0.1)",
                            borderWidth: 8
                        },
                        data: income
                    }

                ]
            };
            mychart.setOption(option);
            window.addEventListener('resize', function () {
                mychart.resize();
            })
        })
        $(function () {
            var str = Array();
            for (var i = 0; i < goodsname.length; i++) {
                var str3 = new Object();
                str3.name = goodsname[i];
                str3.value = income[i];
                str.push(str3);
            }
            var mychart = echarts.init(document.querySelector
            (".pie1 .chart"));
            var option = {
                color: ['#006cff', '#60cda0', '#ed8884', '#ff9f7f', '#0096ff', '#9fe6b8', '#32c5e9', '#1d9dff',
                    '#F11C1C', '#EEDC38'],

                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    bottom: 0,
                    itemWidth: 8,
                    itemHeight: 8,
                    textStyle: {
                        color: "rgba(255,255,255,0.5)",
                        fontSize: 6
                    }
                },
                series: [
                    {
                        name: '净利润分布',
                        type: 'pie',
                        radius: ["10%", "70%"],
                        roseType: 'radius',
                        itemStyle: {
                            borderRadius: 20
                        },
                        label: {
                            fontSize: 10,
                        },
                        labelLine: {
                            //链接图标的线条
                            length: 4,
                            //链接文字的线条
                            length2: 8,
                        },
                        data: str
                    }
                ]
            };
            mychart.setOption(option);
            window.addEventListener("resize", function () {
                mychart.resize();
            })
        })


    </script>


    <c:forEach items="${psi}" var="psii" varStatus="s">
        <script>
            goodsname[${s.count-1}] = '${psii.name}';
            puroff[${s.count-1}] = '${psii.puroff}';
            puroff[${s.count-1}] = parseFloat(puroff[${s.count-1}]);
            saleincome[${s.count-1}] = '${psii.saleincome}';
            saleincome[${s.count-1}] = parseFloat(saleincome[${s.count-1}]);
            income[${s.count-1}] = '${psii.income}';
            income[${s.count-1}] = parseFloat(income[${s.count-1}]);
        </script>
    </c:forEach>
    <c:forEach items="${psc}" var="psc" varStatus="s">
        <script>
            purcount[${s.count-1}] = '${psc.purCount}';
            purcount[${s.count-1}] = parseInt(purcount[${s.count-1}], 10);
            salecount[${s.count-1}] = '${psc.saleCount}';
            salecount[${s.count-1}] = parseInt(salecount[${s.count-1}], 10);
            purcountsum += purcount[${s.count-1}];
            salecountsum += salecount[${s.count-1}];
        </script>
    </c:forEach>
</header>
<section class="mainbox">
    <div class="colum">
        <div class="panel-bar bar1">
            <h2>建材采购量</h2>
            <div class="chart"></div>
            <div class="panel-footer"></div>
        </div>
        <div class="panel-bar line1">
            <h2>建材营业额</h2>
            <div class="chart"></div>
            <div class="panel-footer"></div>
        </div>
    </div>
    <div class="colum">
        <div class="no">
            <div class="no-hd">
                <ul>
                    <li id="jiaoyie">
                        ${xiaoshoue}
                    </li>
                    <li id="jinglirun">${jinglirun}</li>
                </ul>
            </div>
            <div class="no-bd">
                <ul>
                    <li>交易额</li>
                    <li>净利润</li>
                </ul>
            </div>
        </div>
        <div class="map">
            <div class="map1"></div>
            <div class="map2"></div>
            <div class="map3"></div>
            <div class="chart"></div>
        </div>
    </div>
    <div class="colum">
        <div class="panel-bar bar2">
            <h2>建材销售量</h2>
            <div class="chart"></div>
            <div class="panel-footer"></div>
        </div>
        <div class="panel-bar pie1">
            <h2>建材净利润</h2>
            <div class="chart"></div>
            <div class="panel-footer"></div>
        </div>
    </div>
</section>

</body>
</html>