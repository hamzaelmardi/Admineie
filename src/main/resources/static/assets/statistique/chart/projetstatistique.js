/*
by yassine mazouz
01/05/2020
z*/

$(function() {
    "use strict";


    // ------------------------------
    // projet taille impact duree
    // ------------------------------
    var a = c3.generate({
        bindto: "#projet_taille_impact_duree_statistique",
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

