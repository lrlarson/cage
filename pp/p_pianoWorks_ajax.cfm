<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>Untitled Document</title><link href="piano.css" rel="stylesheet" type="text/css" /><cfparam name="works.Work_ID" default="0"><cfquery name="pianoWorks" datasource="cage">SELECT     Works_Table.Work_Title, Works_Table.Work_ID, Works_Table.Work_Alt_Title, Instrument_Specific_Table.Instrument, Instrument_Specific_Table.Inst_Spec_ID,                       Works_Table.Work_Date_String, Works_Table.Work_Length_String, Works_Table.Work_General_CommentsFROM         Works_Table INNER JOIN                      Instrument_Specific_Table ON Works_Table.Specific_Ins = Instrument_Specific_Table.Inst_Spec_IDWHERE     (Instrument_Specific_Table.Inst_Spec_ID = 25)order by  Works_Table.Work_Title</cfquery> <script src="http://code.jquery.com/jquery-latest.js"></script><script type="text/javascript">$(document).ready(function () { // $('.##allRecordings').hide();  });  </script></head><body><script>function formSubmit(){document.leftSubmit.submit();	}    	var mycallBack = function(){         //document.getElementById("callback").innerHTML = "<br><br><b>This is printed by the callback handler.</b>";     }  </script><div class="container">  <div class="sidebar1">  <a href="javascript:ColdFusion.navigate('dataCall.cfm?work={leftSubmit:works.work_ID}','ajaxDiv')">click</a>    <cfform width="175"  id="leftSubmit" name="leftSubmit">    	<cfgrid query="pianoWorks" name="works" format="HTML" gridlines="no" width="175"  colheaders="no" selectOnLoad ="no"   >        	<cfgridcolumn  name="Work_Title" header="Works" bold="yes" >        <cfgridcolumn name="Work_ID" display="no">                </cfgrid>     <!---        <cfinput name="work_submit" type="hidden" bind="{works.work_ID}">   --->    </cfform>         </div>  <cfdiv class="content" name="ajaxDiv"   bind="url:dataCall.cfm?work={leftSubmit:works.work_ID@click}" >    <!-- end .content --></cfdiv>		  <!-- end .container --></div>  </body></html>