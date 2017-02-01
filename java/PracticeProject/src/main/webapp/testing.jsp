<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <title>Quarterly Sales Report</title>

        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.4.min.js"></script>

        <link href="Office.css" rel="stylesheet" type="text/css" />

        <script src="https://appsforoffice.microsoft.com/lib/1/hosted/office.js" type="text/javascript"></script>

        <link href="Common.css" rel="stylesheet" type="text/css" />
        <script src="Notification.js" type="text/javascript"></script>

        <script src="Home.js" type="text/javascript"></script>

        <link rel="stylesheet" href="https://appsforoffice.microsoft.com/fabric/1.0/fabric.min.css">
        <link rel="stylesheet" href="https://appsforoffice.microsoft.com/fabric/1.0/fabric.components.min.css">
		<script>
		
	/* 	var data1;
		 $(document).ready(function() {
		 $.ajax({
         	url: "http://localhost:8080/practiceProject/countries1",
             type: 'GET',
             success: function (data) {
            	alert("inside succuss");
             	data1 = data;
             	//app.showNotification(data[0].id);
                 //return true;
             },
             error: function (data) {
            	 alert("inside failure");
             	//app.showNotification('failure');
             	//return true;
             }
         });
		 }); */
		(function () {
	        "use strict";

	        // The initialize function must be run each time a new page is loaded
	        Office.initialize = function (reason) {
	            $(document).ready(function () {
	                app.initialize();
	                $('#load-data-and-create-chart').click(loadDataAndCreateChart);
	            });
	        };

	        // Load some sample data into the worksheet and then create a chart
	        function loadDataAndCreateChart() {
	            // Run a batch operation against the Excel object model
	            Excel.run(function (ctx) {

	                // Create a proxy object for the active worksheet
	                var sheet = ctx.workbook.worksheets.getActiveWorksheet();

	                //Queue commands to set the report title in the worksheet
	                sheet.getRange("A1").values = "Quarterly Sales Report";
	                sheet.getRange("A1").format.font.name = "Century";
	                sheet.getRange("A1").format.font.size = 26;

	      /*           //Create an array containing sample data
	                var values = [["Product", "Qtr1", "Qtr2", "Qtr3", "Qtr4"],
	                              ["Frames", 5000, 7000, 6544, 4377],
	                              ["Saddles", 400, 323, 276, 651],
	                              ["Brake levers", 12000, 8766, 8456, 9812],
	                              ["Chains", 1550, 1088, 692, 853],
	                              ["Mirrors", 225, 600, 923, 544],
	                              ["Spokes", 6005, 7634, 4589, 8765]];
	                
 */	            
	               
	                var request = $.ajax ({
	                    url: "http://localhost:8080/practiceProject/countries1",
	                    type: "GET",
	                    dataType: "json",
	                    contentType: "application/json; charset=utf-8"                 
	                });

	                
				    request.done(function( data, textStatus, jqXHR ) {
				    	//sheet.getRange("A2:D2").values = [["A","B","C","D"]];
				    	sheet.getRange("A2:D2").values = data.datas;
				    	app.showNotification(data.datas);
	    			});

	    			request.fail(function( jqXHR, textStatus ) {
	    				app.showNotification("Failure!");
	    			});

	                
	                //in the worksheet and bold the header row

	                //range.values = data1;
	                sheet.getRange("A2:D2").format.font.bold = true;

	        /*         //Queue a command to add a new chart
	                var chart = sheet.charts.add("ColumnClustered", range, "auto");

	                //Queue commands to set the properties and format the chart
	                chart.setPosition("G1", "L10");
	                chart.title.text = "Quarterly sales chart";
	                chart.legend.position = "right"
	                chart.legend.format.fill.setSolidColor("white");
	                chart.dataLabels.format.font.size = 15;
	                chart.dataLabels.format.font.color = "black";
	                var points = chart.series.getItemAt(0).points;
	                points.getItemAt(0).format.fill.setSolidColor("pink");
	                points.getItemAt(1).format.fill.setSolidColor('indigo');
 */
	                //Run the queued commands, and return a promise to indicate task completion
	                return ctx.sync();
	            })
	              .then(function () {
	                 // app.showNotification("Done!");
	                  console.log("Success!");
	              })
	            .catch(function (error) {
	                // Always be sure to catch any accumulated errors that bubble up from the Excel.run execution
	                app.showNotification("Error: " + error);
	                console.log("Error: " + error);
	                if (error instanceof OfficeExtension.Error) {
	                    console.log("Debug info: " + JSON.stringify(error.debugInfo));
	                }
	            });
	        }
	    })();
		
		/* Notification functionality */

	    var app = (function () {
	        "use strict";

	        var app = {};

	        // Initialization function (to be called from each page that needs notification)
	        app.initialize = function () {
	            $('body').append(
	                '<div id="notification-message">' +
	                    '<div class="padding">' +
	                        '<div id="notification-message-close"></div>' +
	                        '<div id="notification-message-header"></div>' +
	                        '<div id="notification-message-body"></div>' +
	                    '</div>' +
	                '</div>');

	            $('#notification-message-close').click(function () {
	                $('#notification-message').hide();
	            });


	            // After initialization, expose a common notification function
	            app.showNotification = function (header, text) {
	                $('#notification-message-header').text(header);
	                $('#notification-message-body').text(text);
	                $('#notification-message').slideDown('fast');
	            };
	        };

	        return app;
	    })();
		
		
		
		
		
		
		</script>
		
		<style>
		
		 /* Common app styling */

    #content-header {
        background: #2a8dd4;
        color: #fff;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 80px; /* Fixed header height */
        overflow: hidden; /* Disable scrollbars for header */
    }

    #content-main {
        background: #fff;
        position: fixed;
        top: 80px; /* Same value as #content-header's height */
        left: 0;
        right: 0;
        bottom: 0;
        overflow: auto; /* Enable scrollbars within main content section */
    }

    .padding {
        padding: 15px;
    }

    #notification-message {
        background-color: #818285;
        color: #fff;
        position: absolute;
        width: 100%;
        min-height: 80px;
        right: 0;
        z-index: 100;
        bottom: 0;
        display: none; /* Hidden until invoked */
    }

        #notification-message #notification-message-header {
            font-size: medium;
            margin-bottom: 10px;
        }

        #notification-message #notification-message-close {
            background-image: url("https://devofficecdn.azureedge.net/officedocuments/images/Close.png");
            background-repeat: no-repeat;
            width: 24px;
            height: 24px;
            position: absolute;
            right: 5px;
            top: 5px;
            cursor: pointer;
        }
		
		</style>
    </head>
    <body class="ms-font-m">
        <div id="content-header">
            <div class="padding">
                <h1>Welcome</h1>
            </div>
        </div>
        <div id="content-main">
            <div class="padding">
                <p>This sample shows how to load some sample data into the worksheet, and then create a chart using the Excel JavaScript API.</p>
                <br />
                <h3>Try it out</h3>
                <button class="ms-Button" id="load-data-and-create-chart">Click me!</button>
            </div>
        </div>
    </body>
    </html>