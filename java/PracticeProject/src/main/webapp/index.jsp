<!DOCTYPE html>
<html>
    <head>
        <title>Hello jQuery</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!-- <script src="hello.js"></script> -->
        <script>
        
        $(document).ready(function() {
        	$.ajax({
        		  type: "GET",
        		  url: "http://localhost:8080/practiceProject/countries",
        		  success: function(msg){
        		        alert( "Data Saved: " + msg[0].id );
        		        $('.greeting-id').append(msg[0].id);
        		        $('.greeting-content').append(msg[0].countryName);
        		  },
        		  error: function(XMLHttpRequest, textStatus, errorThrown) {
        		     alert("some error");
        		  }
        		});
        	});

        
        
        
        </script>
    </head>

    <body>
        <div>
            <p class="greeting-id">The ID is </p>
            <p class="greeting-content">The content is </p>
        </div>
    </body>
</html>