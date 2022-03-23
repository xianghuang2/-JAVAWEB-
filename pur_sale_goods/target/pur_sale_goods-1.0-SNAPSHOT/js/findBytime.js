(function () {
    var mychart = echarts.init(document.querySelector
    (".bar1 .chart"));


    var sum = 391 + 391 + 382 + 300 + 290;
    var bili = [(391 / sum * 100).toFixed(1), (391 / sum * 100).toFixed(1), (382 / sum * 100).toFixed(1), (300 / sum * 100).toFixed(1), (290 * 100 / sum).toFixed(1)];
    var mycolor = ["#1089E7", "#F57474", "#56D0E3",
        "#F8B448", "#8B78F6"];
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
            data: ['1349', '656', '737', '420', '1208'],
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
                data: [391, 391, 382, 300, 290],
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
                barWidth: 15,

                data: [100, 100, 100, 100, 100],
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
})();