<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
</head>

<body>
<script>
$(document).ready(function(e) {



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
     

        // The request was successful. Trigger the
        // contacts updated event on the document.
        // That will trigger our own update as well
        // as anyone else listening.
		
       console.log("here we are");
	   console.log(objResponse);
     

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
</body>
</html>