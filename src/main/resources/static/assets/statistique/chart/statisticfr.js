/*
by yassine mazouz
01/05/2020
z*/
function choosechart(param){
    if(param.value==1){ $(".chart1").show();$(".chart2").hide();$(".chart3").hide(); }
    if(param.value==2){ $(".chart2").show();$(".chart1").hide();$(".chart3").hide(); }
    if(param.value==3){ $(".chart3").show();$(".chart1").hide();$(".chart2").hide(); }
}


function choosegraf(param){
    if(param==1){ $(".chart1").show();$(".chart2").hide();$(".chart3").hide(); $("div#example_wrapper").hide(); }
    if(param==2){ $(".chart2").show();$(".chart1").hide();$(".chart3").hide();  $("div#example_wrapper").hide(); }
    if(param==3){ $(".chart3").show();$(".chart1").hide();$(".chart2").hide();

        $('#example').DataTable( {
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
        } );
        $("div#example_wrapper").show();
    }
}


var chart = AmCharts.makeChart( "chartpiediv", {
    "type": "pie",
    "theme": "none",
    "dataProvider": [ {
        "country": "Domaine Routier",
        "litres": 30.9
    }, {
        "country": "Domaine Maritime",
        "litres": 30.9
    }, {
        "country": "Domaine Hydrolique",
        "litres": 40.1
    } ],
    "valueField": "litres",
    "titleField": "country",
    "balloon":{
        "fixedPosition":true
    },
    "export": {
        "enabled": true
    }
} );
$(function() {
    "use strict";
    // ------------------------------
    // Dossiers D'EIE Par Région
    // ------------------------------
    var dossier_eie_region = echarts.init(document.getElementById('dossier_eie_region'));
    var option1 = {
        // Add title
        title: {
            text: "Dossiers D\'EIE Par Région",
            subtext: 'Régions du Maroc',
            x: 'center'
        },

        // Add tooltip
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add legend
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['Tanger-Tétouan-Al Hoceïma', "l\'Oriental", 'Fès-Meknès', 'Rabat-Salé-Kénitra', 'Béni Mellal-Khénifra','Casablanca-Settat',"Marrakech-Safi","Drâa-Tafilalet","Souss-Massa","Guelmim-Oued Noun","Laâyoune-Sakia El Hamra","Dakhla-Oued Ed Dahab"]
        },
        "export": {
            "enabled": true
        },

        // Add custom colors
        color: ['#ffbc34', '#4fc3f7', '#212529', '#f62d51', '#2962FF','#00695c', '#fe5419', '#6659f7', '#00b0ff', '#414755','#0d923c','#94680f'],

        // Display toolbox
        toolbox: {
            show: true,
            orient: 'vertical',
            feature: {
                mark: {
                    show: true,
                    title: {
                        mark: 'Markline switch',
                        markUndo: 'Undo markline',
                        markClear: 'Clear markline'
                    }
                },
                dataView: {
                    show: true,
                    readOnly: false,
                    title: 'View data',
                    lang: ['View chart data', 'Close', 'Update']
                },
                magicType: {
                    show: true,
                    title: {
                        pie: 'Switch to pies',
                        funnel: 'Switch to funnel',
                    },
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            y: '20%',
                            width: '50%',
                            height: '70%',
                            funnelAlign: 'left',
                            max: 5000
                        }
                    }
                },
                restore: {
                    show: true,
                    title: 'Restore'
                },
                saveAsImage: {
                    show: true,
                    title: 'Same as image',
                    lang: ['Save']
                }
            }
        },

        // Enable drag recalculate
        calculable: true,

        // Add series
        series: [{
            name: 'Browsers',
            type: 'pie',
            radius: '70%',
            center: ['50%', '57.5%'],
            data: [
                {value: 1548, name: 'Tanger-Tétouan-Al Hoceïma'},
                {value: 1548, name: "l'Oriental"},
                {value: 1548, name: 'Fès-Meknès'},
                {value: 1548, name: 'Rabat-Salé-Kénitra'},
                {value: 1548, name: 'Béni Mellal-Khénifra'},
                {value: 1548, name: 'Casablanca-Settat'},
                {value: 1548, name: "Marrakech-Safi"},
                {value: 1548, name: "Drâa-Tafilalet"},
                {value: 1548, name: "Souss-Massa"},
                {value: 1548, name: "Guelmim-Oued Noun"},
                {value: 1548, name: "Laâyoune-Sakia El Hamra"},
                {value: 1548, name: "Dakhla-Oued Ed Dahab"}
                
                ]
        }]
    };

    dossier_eie_region.setOption(option1);

    // ------------------------------
    // Dossiers D'EIE Par Type
    // ------------------------------
    new Chart(document.getElementById("dossier_eie_type"), {
        type: 'bar',
        data: {
            labels: ["Type 1", "Type 2", "Type 3", "Type 4", "Type 5"],
            datasets: [
                {
                    label: "Total",
                    backgroundColor: ["#03a9f4", "#e861ff","#08ccce","#e2b35b","#e40503"],
                    data: [8478,6267,5734,4784,1833]
                }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ''
            }
        }
    });

    // ------------------------------
    // Autorisation par type
    // ------------------------------
    var autorisation_type = echarts.init(document.getElementById('autorisation_type'));
    var option2 = {

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


    autorisation_type.setOption(option2);

    // ------------------------------
    // Statistique des visites
    // ------------------------------

    var statistique_visites = echarts.init(document.getElementById('statistique_visites'));
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

    // ------------------------------
    // Statistique des déchets par type
    // ------------------------------
    Morris.Area({
        element: 'dechets_type',
        data: [{
            period: '2010',
            iphone: 50,
            ipad: 80,
            itouch: 20
        }, {
            period: '2011',
            iphone: 130,
            ipad: 100,
            itouch: 80
        }, {
            period: '2012',
            iphone: 80,
            ipad: 60,
            itouch: 70
        }, {
            period: '2013',
            iphone: 70,
            ipad: 200,
            itouch: 140
        }, {
            period: '2014',
            iphone: 180,
            ipad: 150,
            itouch: 140
        }, {
            period: '2015',
            iphone: 105,
            ipad: 100,
            itouch: 80
        },
            {
                period: '2016',
                iphone: 250,
                ipad: 150,
                itouch: 200
            }],
        xkey: 'period',
        ykeys: ['iphone', 'ipad', 'itouch'],
        labels: ['Type 1', 'Type 2', 'Type 3'],
        pointSize: 3,
        fillOpacity: 0,
        pointStrokeColors:['#55ce63', '#2962FF', '#2f3d4a'],
        behaveLikeLine: true,
        gridLineColor: '#e0e0e0',
        lineWidth: 3,
        hideHover: 'auto',
        lineColors: ['#55ce63', '#2962FF', '#2f3d4a'],
        resize: true

    });


    // ------------------------------
    // projet taille impact duree
    // ------------------------------
    var a = c3.generate({
        bindto: "#projet_taille_impact_duree",
        size: { height: 400 },
        data: {
            columns: [
                ["Impact", 130, 200, 150, 40, 360, 50],
                ["Projet", 100, 130, 100, 240, 130, 350],
                ["Durée", 300, 240, 360, 400, 250, 250]
            ],
            type: "bar",
            colors: { data1: "#4fc3f7", data2: "#2962FF" },
            color: function(a, o) { return o.id && "data3" === o.id ? d3.rgb(a).darker(o.value / 150) : a }
        },
        grid: { y: { show: !0 } }
    });

});

