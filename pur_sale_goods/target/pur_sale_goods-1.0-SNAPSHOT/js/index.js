
(function () {
    var mychart=echarts.init(document.querySelector
    (".pie1 .chart"));

    var option = {
        color: ['#006cff', '#60cda0', '#ed8884', '#ff9f7f', '#0096ff', '#9fe6b8', '#32c5e9', '#1d9dff'],

        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            bottom:0,
            itemWidth: 8,
            itemHeight: 8,
            textStyle:{
                color:"rgba(255,255,255,0.5)",
                fontSize:6
            }
        },
        series: [
            {
                name: '消费行为',
                type: 'pie',
                radius: ["0%","70%"],
                itemStyle: {
                    borderRadius: 20
                },
                label:{
                    fontSize:10,
                },
                labelLine:{
                    //链接图标的线条
                    length:4,
                    //链接文字的线条
                    length2: 8,
                },
                data: [
                    { value: 7.4, name: '添加购物车' },
                    { value: 2.6, name: '特别关注' },
                    { value: 5.3, name: '购买' },
                    { value: 84.7, name: '点击' }]

            }
        ]
    };
    mychart.setOption(option);
    window.addEventListener("resize",function () {
        mychart.resize();
    })
})();

(function () {
    var mychart = echarts.init(document.querySelector
    (".line2 .chart"));
    var option = {
        tooltip: {
            trigger: 'axis',
        },
        legend: {
            textStyle: {
                color:"rgba(255,255,255,0.5)",
                fontSize:12
            },
            top:0
        },
        grid: {
            left: 10,
            right: 10,
            bottom:10 ,
            top:30,
            containLabel: true,
            show:true
        },
        xAxis: [
            {
                axisLabel:{
                    textStyle:{
                        color:"rgba(255,255,255,0.6)",
                        fontSize:10
                    }
                },
                axisLine:{
                    lineStyle:{
                        color:"rgba(255,255,255,0.2)"
                    }
                },
                type: 'category',
                boundaryGap: false,
                data:  [ "0","1","2","3","4","5","6","7"],
            }
        ],
        yAxis: [
            {
                type: 'value',
                axisTick:{
                    show:false
                },
                axisLabel:{
                    textStyle:{
                        color:"#4c9bfd",
                        fontSize:12
                    } ,
                    axisLine:{
                        lineStyle:{
                            color:"rgba(255,25,255,0.1)",
                        }
                    },
                    splitLine:{
                        lineStyle:{
                            color:"rgba(255,25,255,0.1)"
                        }
                    }
                },
                data:  ["0","360","380","400","420","440","460","480"],
            }
        ],
        series: [
            {
                smooth:true,
                name: 'man',
                type: 'line',
                areaStyle: {
                    color:new echarts.graphic.LinearGradient(
                        0,0,0,1,[
                            {
                                offset:0,
                                color:"rgba(1,132,213,0.4)"
                            },
                            {
                                offset:0.8,
                                color:"rgba(1,132,213,0.1)"
                            }
                        ],false
                    ),
                    shadowColor:"rgba(0,0,0,0.1)"
                },
                //设置拐点
                symbol:"circle",
                symbolSize:5,
                //设置拐点样式
                showSymbol:true,
                itemStyle:{
                    color:"#0184d5",
                    borderColor:"rgba(221,220,107,0.1)",
                    borderWidth: 8
                },
                lineStyle:{
                    color:"#0184d5",
                    width:2
                },
                data:  [ 436,445,417,460,390,403,382,367],
            },
            {
                smooth:true,
                name: 'women',
                type: 'line',
                lineStyle:{
                    color:"#00d887",
                    width:2
                },
                areaStyle: {
                    color:new echarts.graphic.LinearGradient(
                        0,0,0,1,[
                            {
                                offset:0,
                                color:"rgba(0,216,135,0.4)"
                            },
                            {
                                offset:0.8,
                                color:"rgba(0,216,135,0.1)"
                            }
                        ],false
                    ),
                    shadowColor:"rgba(0,0,0,0.1)"
                },
                symbol:"circle",
                symbolSize:5,
                showSymbol:true,
                itemStyle:{
                    color:"#00d887",
                    borderColor:"rgba(221,220,107,0.1)",
                    borderWidth:8
                },
                data: [ 451,408,413,378,434,436,435,419],
            },

        ]
    };
    mychart.setOption(option);
    window.addEventListener('resize',function () {
        mychart.resize();
    })
})();

(function () {
    var mychart=echarts.init(document.querySelector
    (".pie2 .chart"));
    var option = {
        color: [ '#0096ff', '#9fe6b8', '#32c5e9', '#1d9dff'],

        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            bottom:0,
            itemWidth: 8,
            itemHeight: 8,
            textStyle:{
                color:"rgba(255,255,255,0.5)",
                fontSize:6
            }
        },
        series: [
            {
                name: '男女购买比例',
                type: 'pie',
                radius: ["0%","70%"],
                roseType: 'radius',
                itemStyle: {
                    borderRadius: 20
                },
                label:{
                    fontSize:10,
                },
                labelLine:{
                    //链接图标的线条
                    length:4,
                    //链接文字的线条
                    length2: 8,
                },
                data: [
                    { value: 33.3, name: '男' },
                    { value: 33.3, name: '女' },
                    { value: 33.3, name: '未知' },
                ]
            }
        ]
    };
    mychart.setOption(option);
    window.addEventListener("resize",function () {
        mychart.resize();
    })
})();

(function () {
    var mychart = echarts.init(document.querySelector
    (".bar1 .chart"));
    var sum=391+391+382+300+290;
    var bili=[(391/sum*100).toFixed(1),(391/sum*100).toFixed(1),(382/sum*100).toFixed(1),(300/sum*100).toFixed(1),(290*100/sum).toFixed(1)];
    var mycolor=["#1089E7","#F57474","#56D0E3",
    "#F8B448","#8B78F6"];
    var option = {
        grid: {
            left: '22%',
            top: '10%',
            bottom: '10%',
           // containLabel: true
        },
        xAxis: {
            type: 'value',
            show:false,
        },
        yAxis: [{
            type: 'category',
            inverse:true,
            data: [ '1349', '656', '737', '420', '1208'],
            axisLine:{
                show:false
            },
            //不显示刻度
            axisTick: {
                show:false
            },
            axisLabel:{
                color:"#fff",
                fontSize:10
            }
        },
            {
                type: 'category',
                inverse:true,
                data: [391,391,382,300,290],
                axisLine:{
                    show:false
                },
                //不显示刻度
                axisTick: {
                    show:false
                },
                axisLabel:{
                    color:"#fff",
                    fontSize:10
                }
            },
        ],
        series: [
            {
                name: '条',
                type: 'bar',
                itemStyle:{
                    barBorderRadius:20,
                    //此时的color可以修改柱子颜色
                    color:function (params) {
                        return mycolor[params.dataIndex];
                    }
                },
                //柱子间距离
                barCategoryGap:50,
                //柱子宽度
                barWidth:10,
                //显示柱子内文字
                label:{
                    show:true,
                    position:"inside",
                    //{c}c会自动获取柱子内数据
                    formatter:"{c}%",


                },
                data: bili,
                yAxisIndex:0,
            },
            {
                name: '框',
                type: 'bar',
                //柱子间距离
                barCategoryGap:50,
                //柱子宽度
                barWidth:15,

                data: [100, 100,100,100,100],
                itemStyle:{
                    barBorderRadius:15,
                    //此时的color可以修改柱子颜色
                    color:"none",
                    borderColor:"#00c1de",
                    borderWidth:3,
                },
                yAxisIndex:1,
            }
        ]
    };
    mychart.setOption(option);
    window.addEventListener('resize',function () {
        mychart.resize();
    })
})();





(function(){
    var myChart=echarts.init(document.querySelector
    ('.map .chart'));

    var name_title = "淘宝双11各省份销量";
    var name_fontFamily = '等线';
    var name_fontSize = 25;
    var mapName = 'china';
    var data = [
        {name:"北京",value:1770},
        {name:"天津",value:420},
        {name:"河北",value:1020},
        {name:"山西",value:810},
        {name:"内蒙古",value:470},
        {name:"辽宁",value:670},
        {name:"吉林",value:820},
        {name:"黑龙江",value:660},
        {name:"上海",value:240},
        {name:"江苏",value:920},
        {name:"浙江",value:1140},
        {name:"安徽",value:1090},
        {name:"福建",value:1160},
        {name:"江西",value:910},
        {name:"山东",value:1190},
        {name:"河南",value:1370},
        {name:"湖北",value:1160},
        {name:"湖南",value:1140},
        {name:"重庆",value:910},
        {name:"四川",value:1250},
        {name:"贵州",value:620},
        {name:"云南",value:830},
        {name:"西藏",value:90},
        {name:"陕西",value:800},
        {name:"甘肃",value:560},
        {name:"青海",value:100},
        {name:"宁夏",value:180},
        {name:"新疆",value:670},
        {name:"广东",value:1230},
        {name:"广西",value:590},
        {name:"海南",value:140},
    ];

    var geoCoordMap = {};

    /*获取地图数据*/
    myChart.showLoading();
    var mapFeatures = echarts.getMap(mapName).geoJson.features;
    myChart.hideLoading();
    mapFeatures.forEach(function(v) {
        // 地区名称
        var name = v.properties.name;
        // 地区经纬度
        geoCoordMap[name] = v.properties.cp;

    });

// console.log("============geoCoordMap===================")
// console.log(geoCoordMap)
// console.log("================data======================")
    console.log(data)
    var max = 480,
        min = 9; // todo
    var maxSize4Pin = 100,
        minSize4Pin = 20;

    var convertData = function(data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].name];
            if (geoCoord) {
                res.push({
                    name: data[i].name,
                    value: geoCoord.concat(data[i].value),
                });
            }
        }
        return res;
    };
    option = {
        title: {
            text: name_title,
            x: 'center',
            textStyle: {
                color: "#fff",
                fontFamily: name_fontFamily,
                fontSize: name_fontSize
            }
        },

        // legend: {
        //     orient: 'vertical',
        //     y: 'bottom',
        //     x: 'right',
        //     data: ['credit_pm2.5'],
        //     textStyle: {
        //         color: '#fff'
        //     }
        // },
        visualMap: {
            show: true,
            min: 0,
            max: 2500,
            left: 'left',
            top: 'bottom',
            text: ['高', '低'], // 文本，默认为数值文本
            calculable: true,
            seriesIndex: [1],
            inRange: {
                // color: ['#3B5077', '#031525'] // 蓝黑
                // color: ['#ffc0cb', '#800080'] // 红紫
                // color: ['#3C3B3F', '#605C3C'] // 黑绿
                // color: ['#0f0c29', '#302b63', '#24243e'] // 黑紫黑
                // color: ['#23074d', '#cc5333'] // 紫红
                //color: ['#00467F', '#A5CC82'] // 蓝绿
                 color: ['#1488CC', '#2B32B2'] // 浅蓝
                // color: ['#00467F', '#A5CC82'] // 蓝绿
                // color: ['#00467F', '#A5CC82'] // 蓝绿
                // color: ['#00467F', '#A5CC82'] // 蓝绿
                // color: ['#00467F', '#A5CC82'] // 蓝绿

            },
            textStyle:{
                color:"#fff"
            }
        },
        /*工具按钮组*/
        // toolbox: {
        //     show: true,
        //     orient: 'vertical',
        //     left: 'right',
        //     top: 'center',
        //     feature: {
        //         dataView: {
        //             readOnly: false
        //         },
        //         restore: {},
        //         saveAsImage: {}
        //     }
        // },
        geo: {
            show: true,
            map: mapName,
            label: {
                normal: {
                    show: false
                },
                emphasis: {
                    show: false,
                }
            },
            roam: false,
            itemStyle: {
                normal: {
                    areaColor: '#031525',
                    borderColor: '#3B5077',
                },
                emphasis: {
                    areaColor: '#2B91B7',
                }
            }
        },
        series: [{
            name: '散点',
            type: 'scatter',
            coordinateSystem: 'geo',
            data: convertData(data),

            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                },
                emphasis: {
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#05C3F9'
                }
            }
        },
            {
                type: 'map',
                map: mapName,
                geoIndex: 0,
                aspectScale: 0.75, //长宽比
                showLegendSymbol: false, // 存在legend时显示
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: false,
                        textStyle: {
                            color: '#fff'
                        }
                    }
                },
                roam: true,
                itemStyle: {
                    normal: {
                        areaColor: '#031525',
                        borderColor: '#3B5077',
                    },
                    emphasis: {
                        areaColor: '#2B91B7'
                    }
                },
                animation: false,
                data: data
            },



        ]
    };
    myChart.setOption(option);
    window.addEventListener('resize',function () {
        myChart.resize();
    })
})();