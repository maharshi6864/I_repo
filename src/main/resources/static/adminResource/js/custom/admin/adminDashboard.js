window.addEventListener("load", function () {	

    getUserUsage();
})

function getUserUsage() {
    
    let container = document.getElementById("container");
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let response = JSON.parse(htp.responseText);
            const userUsageArray = response.body.userUsage;
            const totalUser=response.body.totalUser;
            const totalUsage=response.body.totalUsage;
            let averageUsage=totalUsage/totalUser;
            document.getElementById("average-usage").innerHTML=averageUsage.toFixed(4)+"GB";
            document.getElementById("total-usage").innerHTML=totalUsage.toFixed(4)+"GB";
            document.getElementById("total-users").innerHTML=totalUser;
            let data =""
            for (var i = 0; i < userUsageArray.length; i++) {
				data=data+`<input type="hidden" name="xvalue" value="${userUsageArray[i].username}" />`;
			}

            for (var i = 0; i < userUsageArray.length; i++) {
			data=data+`<input type="hidden" name="yvalue" value="${userUsageArray[i].usage}" />`;
            }
            container.innerHTML = data;
            graph();
        }
    };
    htp.open("GET", `getAdminDashboardDetails`, true);
    htp.send();
}


function graph() {
    var xvalue = document.getElementsByName("xvalue");
    var xdata = [];
    var yvalue = document.getElementsByName("yvalue");
    var ydata = [];
    for (var i = 0; i < xvalue.length; i++) {
        xdata.push(xvalue[i].value);
        ydata.push(parseFloat(yvalue[i].value));
    }
    Highcharts.chart({
        chart: {
            renderTo: "container",
            type: 'column'
        },
        title: {
            text: 'Storage Usage By Users In GB'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: xdata,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Space'
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Users',
            data: ydata,
            color: '#556ee6'
        }]
    });
}