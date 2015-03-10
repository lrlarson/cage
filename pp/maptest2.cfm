<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>4'33" Performances Worldwide</title>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://maps.google.com/maps/api/js?sensor=false"
          type="text/javascript"></script>

</head>

<body>
<div class="container" style="width:1000px; height:800px">
  <div id="map"style="width:auto;height:900px;"></div>
</div>

</body>
<script>
var map =new google.maps.Map(document.getElementById('map'),{
      zoom:4,
      center:new google.maps.LatLng(38.82,-98.57),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

</script>


<script>
$(document).ready(function(e) {
	var urlPrefix = 'https://s3.amazonaws.com/john_cage_433/';


    $.ajax(
    {
    type: "get",
    url: "cageJSON.cfc",
    data: {
    method: "getUploadedRecordings",
    },
    dataType: "json",
    // Define request handlers.
    success: function( objResponse ){
    // Check to see if request was successful.
    if (objResponse){
	console.log(objResponse);
	//set up map
	 var infowindow =new google.maps.InfoWindow();
    var marker, i;
	
	for (i=0;i<objResponse.DATA.length;i++){
		console.log(objResponse.DATA[i][5]);
		console.log(objResponse.DATA[i][4]);
		console.log(objResponse.DATA[i][1]);
		console.log(objResponse.DATA[i][2]);
		console.log(objResponse.DATA[i][3]);
		//Insert Basic Markers
		 marker =new google.maps.Marker({
        position:new google.maps.LatLng(objResponse.DATA[i][2], objResponse.DATA[i][3]),
        map: map
      
	  
	  });
	  //set up listening window
	   google.maps.event.addListener(marker,'click',(function(marker, i){
        return function(){
			content = 'Title: '+objResponse.DATA[i][5];
			content = content + '<br /> Recordist: '+ objResponse.DATA[i][4];
			content = content + '<br /> Date: ' + objResponse.DATA[i][1];
			for (x=1;x<4;x++)	{
			url = urlPrefix + encodeURIComponent(objResponse.DATA[i][6]);
			url= url+'/Mv' + x + '.wav';
			content = content + '<p><a href=' + url +'> Movement '+x +'</a></p>';
			}
          infowindow.setContent(content);
		  
          infowindow.open(map, marker);
        }
      })(marker, i));
	  
		for (x=1;x<4;x++)	{
		url = urlPrefix + encodeURIComponent(objResponse.DATA[i][6]);
		url= url+'/Mv' + x + '.wav';
		console.log(url);
			}
		}
    } else {
     

    // The response was not successful. Show
    // an errors to the user.
    console.log( objResponse );
	//objSelf.ShowErrors( objResponse.ERRORS );
     

    }
    },
     

    error: function( objRequest, strError ){
   // objSelf.ShowErrors( [ "An unknown connection error occurred." ] );
   console.log(objRequest);
   console.log('error');
    }
    }
   );


});

</script>

</html>