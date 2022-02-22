/*
by yassine mazouz
01/05/2020
z*/

$(function() {
    "use strict";

    
    // ------------------------------
    // Dossiers D'EIE Par Type
    // ------------------------------
    
    new Chart(document.getElementById("dossier_eie_type_statistique"), {
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
        "export": {
            "enabled": true
        },
        "legend": {
           
            "labelText": "aaaaaaaaaaaaa",
            "valueText": " nnnnnnnnnnn",
            "valueWidth": 80,
            "textClickEnabled": true
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ''
            }
        }
    });

 
});

