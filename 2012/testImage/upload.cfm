<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<!--- This code creates a form with one field where the user enters the image file to upload. ---> 
<cfform action="makeThumbnail.cfm" method="post" enctype="multipart/form-data"> 
Please upload an image: <cfinput type="file" name="image"> 
<cfinput type="submit" value="Send Image" name="Submit"> 
</cfform>
</body>
</html>