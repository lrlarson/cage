<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>
<cfset dateTimeCreatedString = '201305281533'>

<cfoutput>
<cfset Year = #left(dateTimeCreatedString,4)#>
<cfset Month = #mid(dateTimeCreatedString,5,2)#>
<cfset Day = #mid(dateTimeCreatedString,7,2)#>
<cfset Hour	= #mid(dateTimeCreatedString,9,2)#>
<cfset Minute	= #mid(dateTimeCreatedString,11,2)#>
<cfset dateTimeCreated = CreateDateTime(#Year#,Month,Day,Hour,Minute,0)>
#dateTimeCreated#
</cfoutput>

</body>
</html>