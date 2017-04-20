//bar-chart-stack  
var d4_1 = [["Jan", 126],["Feb", 73],["Mar", 94],["Apr", 54],["May", 92],["Jun", 141],["Jul", 29],["Aug", 44],["Sep", 30],["Oct", 40],["Nov", 67],["Dec", 92]];
    var d4_2 = [["Jan", 58],["Feb", 61],["Mar", 46],["Apr", 35],["May", 55],["Jun", 46],["Jul", 57],["Aug", 80],["Sep", 100],["Oct", 91],["Nov", 35],["Dec", 57]];
    $.plot("#bar-chart-stack", [{
        data: d4_1,
        label: "New Visitor",
        color: "#3DB9D3"
    },{
        data: d4_2,
        label: "Returning Visitor",
        color: "#ffce54"
    }], {
        series: {
            stack: !0,
            bars: {
                align: "center",
                lineWidth: 0,
                show: !0,
                barWidth: .6,
                fill: .9
            }
        },
        grid: {
            borderColor: "#fafafa",
            borderWidth: 1,
            hoverable: !0
        },
        tooltip: !0,
        tooltipOpts: {
            content: "%x : %y",
            defaultTheme: false
        },
        xaxis: {
            tickColor: "#fafafa",
            mode: "categories"
        },
        yaxis: {
            tickColor: "#fafafa"
        },
        shadowSize: 0
    });