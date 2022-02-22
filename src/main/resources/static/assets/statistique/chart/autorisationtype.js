/*
by yassine mazouz
01/05/2020
z*/

$(function() {
    "use strict";


    // ------------------------------
    // Autorisation par type
    // ------------------------------
    var autorisation_type_statistique = echarts.init(document.getElementById('autorisation_type_statistique'));
    var optionaa = {

        backgroundColor: '#fff',

        title: {
            text: '',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        series : [
            {
                name:'Browsers',
                type:'pie',
                radius : '70%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'Type 1'},
                    {value:310, name:'Type 2'},
                    {value:274, name:'Type 3'},
                    {value:235, name:'Type 4'},
                    {value:400, name:'Type 5'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(0, 0, 0, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(0, 0, 0, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#2962FF',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };


    autorisation_type_statistique.setOption(optionaa);
    
    

 
});

