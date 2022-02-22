/*
by yassine mazouz
01/05/2020
z*/

$(function() {
    "use strict";


    // ------------------------------
    // Statistique des visites
    // ------------------------------

    var statistique_visites = echarts.init(document.getElementById('statistique_visites_statistique'));
    var option3 = {

        grid: {
            left: '1%',
            right: '2%',
            bottom: '3%',
            containLabel: true
        },
        tooltip: {
            trigger: 'axis'
        },
        // Add legend
        legend: {
            data: ['Type 1', 'Type 2', 'Type 3', 'Type 4', 'Type 5']
        },

        // Add custom colors
        color: ['#212529', '#7460ee', '#f62d51', '#36bea6','#2962FF' ],

        // Enable drag recalculate
        calculable: true,

        // Hirozontal axis
        xAxis: [{
            type: 'category',
            boundaryGap: false,
            data: [
                'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'
            ]
        }],

        // Vertical axis
        yAxis: [{
            type: 'value'
        }],

        // Add series
        series: [
            {
                name: 'Type 1',
                type: 'line',
                stack: 'Total',
                areaStyle: {},
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: 'Type 2',
                type: 'line',
                stack: 'Total',
                areaStyle: {},
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: 'Type 3',
                type: 'line',
                stack: 'Total',
                areaStyle: {},
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: 'Type 4',
                type: 'line',
                stack: 'Total',
                areaStyle: {},
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: 'Type 5',
                type: 'line',
                stack: 'Total',
                areaStyle: {},
                data: [820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
        // Add series

    };
    statistique_visites.setOption(option3);

 
});

