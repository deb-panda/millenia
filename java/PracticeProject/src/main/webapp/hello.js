//$(document).ready(function() {
//    $.ajax({
//        url: "http://localhost:8080/practiceProject/countries"
//    }).then(function(data) {
//       $('.greeting-id').append(data.id);
//       $('.greeting-content').append(data.countryName);
//    });
//});

$(document).ready(function() {
$.ajax({
	  type: "GET",
	  url: "http://localhost:8080/practiceProject/countries",
	 // data: "name=John&location=Boston",
	  success: function(msg){
	        alert( "Data Saved: " + msg[0].id );
	        $('.greeting-id').append(msg[0].id);
	        $('.greeting-content').html(msg[0].countryName);
	  },
	  error: function(XMLHttpRequest, textStatus, errorThrown) {
	     alert("some error");
	  }
	});
});