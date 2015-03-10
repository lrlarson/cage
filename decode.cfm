<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<cfquery name="recording" datasource="cage">
SELECT * FROM dbo.[tbl_4-33Data]
WHERE id = 35
</cfquery>


</head>

<body>

<cfoutput>

Begin Query Results <br />
<cfset recordingNameBase = #recording.title#>
<cfset beginString = 'https://s3.amazonaws.com/john_cage_433/'>
<cfset encodeString = URLEncodedFormat(#recording.recordingUUID#&'/'&#recordingNameBase#)>
<cfset endString = '/Mv1.wav'>
final output = #beginString##encodeString##endString#
</cfoutput>
</body>
</html>