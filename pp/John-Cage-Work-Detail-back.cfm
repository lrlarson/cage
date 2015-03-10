-<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>John Cage Work Detail</title>
<link href="assets/works.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="assets/css/reset.css" />
<link type="text/css" rel="stylesheet" href="assets/css/960.css" />


<!--- set up cfajax proxy, using JSON cfc --->

<cfajaxproxy cfc="cageJSON" jsclassname="cageJSON">

<!--- set up jQuery --->
<script type="text/javascript" src= "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>

<!--- get the page's JS --->
<script type="text/javascript" src="assets/js/cage.js"></script>

<!--- init normal CFC for non ajax calls  --->
<cfparam name="work_ID" type="numeric" default="17">
<script type="text/javascript">
var pageWorkID = 0;
<cfoutput>
pageWorkID = #work_ID#;
</cfoutput>
</script>

<cfscript>
cage = CreateObject("Component","cage");
cage.init();
details = cage.getWorkDetails(#work_ID#);
recordings = cage.getRecordSummary(#work_ID#);
manuscripts = cage.getManuscriptLocationsForWork(#work_ID#);
</cfscript>

<style>
#logo-zone {
	position: absolute;
	top: 238px;
	left: 511px;
	height: 21px;
	width: 129px;
	background-color: #FFF;
}

.addthis_toolbox .custom_hover {
    position: relative;
}

.addthis_toolbox .custom_hover .custom_button {
	font-weight: normal;
	padding: 6px 12px 6px 12px;
	color: #000000;
	cursor: pointer;
	-moz-border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
}

.addthis_toolbox .custom_hover .custom_button.active {
    background-color: #eee;
}

.addthis_toolbox .hover_menu  {
    display: none;
    position: absolute;
    background: #fff;
}

.addthis_toolbox .custom_hover .tower {
    -webkit-border-radius: 0 5px 0 0;   
    -moz-border-radius-topleft: 0;
    
}
.addthis_toolbox .hover_menu  {
    width: 136px;
    padding: 1px;
    border: 3px solid #eee;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
}

.addthis_toolbox .hover_menu a {    
    position: relative;
    display: block;
    width: 102px;
    padding: 4px 0 4px 34px;
    text-decoration: none;
    color: #00bff3;
}

.addthis_toolbox .hover_menu a:hover {    
    background: #f5f5f5;
    color: #999999;
    text-decoration: none;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}

.addthis_toolbox .hover_menu span {
    position: absolute;
    left: 14px;
    top: 4px;
}

.addthis_toolbox .hover_menu .more {
    border-top: solid 1px #eee;
    padding: 10px 0 0 0;
    margin: 10px 10px 0 10px;
    text-align: center;
}

.addthis_toolbox .hover_menu .more a {
    padding: 4px 0;
    margin: 0;
}

.addthis_toolbox .hover_menu .more a:hover {
    background: none;
}
.addthis_toolbox .hover_menu .more span {
    display: none;
}


</style>


</head>

<body>
<div class="header"><div class="container_12 top-sec">
<span class="share"><div class="addthis_toolbox">
    <div class="custom_hover">
        <span class="custom_button">+Share</span>
    </div>
    <div class="hover_menu">
        <div class="column1">
            <a class="addthis_button_email">Email</a>
        </div>
        <div class="column2">
            <a class="addthis_button_print">Print</a>
        </div>
        <div class="clear"></div>
        <div class="top"></div>
        <div class="column1">
            <a class="addthis_button_twitter">Twitter</a>
            <a class="addthis_button_facebook">Facebook</a>
            <a class="addthis_button_myspace">MySpace</a>
        </div>
        <div class="column2">
            <a class="addthis_button_delicious">Delicous</a>
            <a class="addthis_button_stumbleupon">Stumble</a>
            <a class="addthis_button_digg">Digg</a>
        </div>
        <div class="clear"></div>
        <div class="more">
            <a class="addthis_button_expanded">More...</a>
        </div>
    </div>
</div></span>

<div class="grid_2 prefix_4">
                <a href="http://www.johncage.org" style="font-style: italic; color: #000;text-decoration:none;">John Cage</a>
    </div>

<div class="grid_3">
<ul class="navigation">
  <li><a href="http://www.johncage.org/2012">2012 Centennial Archives</a></li>
  <li class="new"><a href="./sonatas-and-interludes.cfm">Sonatas and Interludes <span class="new">New</span></a></li>
  <li class="new"><a href="http://www.johncage.org/cagePiano.html">Prepared Piano App New</a></li>
                  <li><a href="http://www.johncage.org/autobiographical_statement.html" title="An autobiographical statement of John Cage.">Autobiographical Statement</a></li>
                  <li><a href="../about.html" title="Learn more about the John Cage Trust.">About the John Cage Trust</a></li>
                  <li><a href="http://www.johncage.org/indeterminacy.html" title="Eddie Kohler's beautiful application devoted to John Cage's Indeterminacy: New Aspect of Form in Instrumental and Electronic Music.">Indeterminacy</a></li>
 <li><a href="http://www.johncage.org/autobio/JohnCageFolksonomy.html" target="_blank" class="external" title="Announcing the John Cage Folksonomy, an expandable roster of friends and acquaintances of John Cage to which you can contribute.">Folksonomy</a></li>
                  <li><a href="http://www.johncage.org/blog.html" title="Official blog of the John Cage Trust. Laura Kuhn, Executive Director.">Kuhn's Blog</a></li>
<li class="selected">Database of Works<span class="new"></span></li>
<li><a href="../events/events.html" title="Cage Related Events">Calendar of Events<span class="new"></span></a></li>
                        <li><a href="../reunion/index.html" title="Reunion">Reunion<span class="new"></span></a></li><br />
</ul>
</div>

<div class="grid_3 omega">
<ul class="right-list">

</ul>
</div>
</div>
</div>
<div class="clear"></div>

<!--- begin main content --->
<div class="container_12">

<div class="grid_6">
<div class="content" style="width: 450px; ">
<cfoutput> 
<table width="450px" border="0"  cellpadding="10" style="" class="tableTop">
  <tr>
    <td class="labelCell" height="30"  >Work Details<span style="padding-left:210px" id="detailLink"><a href="John-Cage-Works.cfm">Back to Search</a></span></td>
  </tr>
  <tr class="danceRow" height="55px" style="line-height:30px">
   		<td class="tableRegularCellHighlight">
        <span  class="field">Work Title</span><br />
        <span id="titleField"> <i>
       #details.Work_Title#
        </i> </span> 
        </td>
        </tr>
  </table>

<div id="scroll" style="overflow-y:scroll;overflow-x=hidden;  height:550px;" >
<table id="detailsTable" width="435x" height="300px"    >


       <cfif #details.Work_Alt_Title# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Alt. Title</span><br />
       <span id="dataField"> <i>#details.Work_Alt_Title#</i> </span>
       </td>
       </tr>
       </cfif>
        </tr>
       <cfif #details.Work_Alt_Title_2# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Alt. Title</span><br />
       <span id="dataField"> #details.Work_Alt_Title_2# </span>
       </td>
       </tr>
       </cfif>
       <cfif #details.Work_Date_String# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Date</span><br />
       <span id="dataField"> #details.Work_Date_String# </span>
       </td>
       </tr>
       </cfif>
       
        <cfif #details.Ensemble_Type# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Ensemble Type</span><br />
       <span id="dataField"> #details.Ensemble_Type#  </span>
       </td>
       </tr>
       </cfif>
       
        <cfif #details.Work_Length_String# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Work Length</span><br />
       <span id="dataField"> #details.Work_Length_String#  </span>
       </td>
       </tr>
       </cfif>
       
       <cfif #details.Work_Ins_text_string# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Instrumentation</span><br />
       <span id="dataField"> #details.Work_Ins_text_string#  </span>
       </td>
       </tr>
       </cfif>
       
       <cfif #details.Work_General_Comments# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Comments</span><br />
       <span id="dataField"> #details.Work_General_Comments#</span>
       </td>
       </tr>
       </cfif>
       
        <cfif #details.Dedicated# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Dedicatee(s)</span><br />
       <span id="dataField"> #details.Dedicated#</span>
       </td>
       </tr>
       </cfif>
       
       <cfif #details.Arranger_Name# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Arranger</span><br />
       <span id="dataField"> #details.Arranger_Name#</span>
       </td>
       </tr>
       </cfif>
       
        <cfif #details.Work_Editor# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Editor</span><br />
       <span id="dataField"> #details.Work_Editor#</span>
       </td>
       </tr>
       </cfif>
       
        <cfif #details.Work_Source_Peters# NEQ ''> 
       <tr class="danceRow">
       <td class="tableRegularCellData">
       <span  class="field">Publication</span><br />
       <span id="dataField"> #details.Work_Source_Peters#</span>
       </td>
       </tr>
       </cfif>

</table>
</div>
</cfoutput>

</div>
</div> <!--- end container 9 --->

<div class="grid_5" >
<div class="content" style="background-color: #fff; width: 330px; height:340px;">
<table width="330px" border="0"  cellpadding="10" style="" class="tableTop">
  <tr id="recordingHeader">
  	
    <td class="labelCell"  height="30"  >Recordings Summary (click for details)</td>
   
  </tr>
  </table>
  <div id="scroll2" style="overflow-y:scroll;overflow-x:hidden;  height:606px;width: 330px;" >
  <table id="detailsTable2" width="330x" height="280px"    >
  	<cfoutput query="recordings">
    <tr class="danceRow">
    <td class="tableRegularCellData">
    <a href="javascript:getRecordDetails(#recordings.record_ID#)">#recordings.Record_Title#</a>
    </td>
    <td class="tableRegularCellData">
     <a href="javascript:getRecordDetails(#recordings.record_ID#)">
    <img src="../db_images/Discog/DiscImages/#Cover_Thumb_Filename#" width="75" height="75" style="padding-right:5px"></a>
    </td>
    </tr>
    </cfoutput>
  </table>
  
</div><!--- end container 3--->







</div>
<div class="clear"></div>

</body>
<script type="text/javascript">


	$(document).ready(function(e) {
		/*
		 $("#loading").hide();
		 $('#detailTable').hide();	
       getFilteredWorks(length,premiereYear,manuscriptLocation,ensembleType,instrumentType,specificInstrument,searchString,collaborators,recordings,published,numberString,numberLimit,cunningham);
	   */
	   $('td').click(function(event){
		//alert($(this).attr('id')); 
	   	$(this).toggleClass("highlight");
	    });
    });
	</script>
<script type="text/javascript">
$(function() {
    var delay = 400;
    
    function hideMenu() {
        if (!$('.custom_button').data('in') && !$('.hover_menu').data('in') && !$('.hover_menu').data('hidden')) {
            $('.hover_menu').fadeOut('fast');
            $('.custom_button').removeClass('active');
            $('.hover_menu').data('hidden', true);
        }
    }
    
    $('.custom_button, .hover_menu').mouseenter(function() {
        $('.hover_menu').fadeIn('fast');
        $('.custom_button').addClass('active');
        $(this).data('in', true);
        $('.hover_menu').data('hidden', false);
    }).mouseleave(function() {
        $(this).data('in', false);
        setTimeout(hideMenu, delay);
    });    
    
});
</script>
</html>