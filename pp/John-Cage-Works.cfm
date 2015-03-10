<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>John Cage Complete Works</title>
<link href="assets/works.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="assets/css/reset.css" />
<link type="text/css" rel="stylesheet" href="assets/css/960.css" />
<link type="text/css" rel="stylesheet" href="assets/css/master.css" />
<!--- set up cfajax proxy, using JSON cfc --->

<cfajaxproxy cfc="cageJSON" jsclassname="cageJSON">

<!--- set up jQuery --->
<script type="text/javascript" src= "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>

<!--- get the page's JS --->
<script type="text/javascript" src="assets/js/cage.js"></script>

<!--- init normal CFC for non ajax calls  --->
<cfscript>
cage = CreateObject("Component","cage");
cage.init();
manuscriptLocations = cage.getManuscriptLocations();
ensembleTypes = cage.getEnsembleTypes();
instrumentTypes = cage.getInstrumentTypes();
specificInstruments = cage.getSpecificInstruments();
collaborators = cage.getCollaborators();
</cfscript>

</head>

<body style="background-color: #fff3bd;">
<div class="container_12">

	<!-- NAVIGATION -->
        
  <div id="nav">
            <div class="grid_2 prefix_4">
                <a href="http://www.johncage.org" style="font-style: italic; color: #000;">John Cage</a>
    </div>
    <div class="grid_3">
    <ul class="navigation">
  <li><a href="http://www.johncage.org/2012">2012 Centennial Archives</a></li>
   <li><a href="http://www.johncage.org/4_33.html">4&#8242;33&#8243; App</a></li><br />
  <li><a href="http://www.johncage.org/preparedPiano/sonatas_and_interludes.html">Sonatas and Interludes </a></li>
  <li><a href="http://www.johncage.org/cagePiano.html">Prepared Piano App</a></li>
                  <li><a href="http://www.johncage.org/autobiographical_statement.html" title="An autobiographical statement of John Cage.">Autobiographical Statement</a></li>
                  <li><a href="http://www.johncage.org/about.html" title="Learn more about the John Cage Trust.">About the John Cage Trust</a></li>
                  <li><a href="http://www.johncage.org/indeterminacy.html" title="Eddie Kohler's beautiful application devoted to John Cage's Indeterminacy: New Aspect of Form in Instrumental and Electronic Music.">Indeterminacy</a></li>
 <li><a href="http://www.johncage.org/autobio/JohnCageFolksonomy.html" target="_blank" class="external" title="Announcing the John Cage Folksonomy, an expandable roster of friends and acquaintances of John Cage to which you can contribute.">Folksonomy</a></li>
                  <li><a href="http://www.johncage.org/blog.html" title="Official blog of the John Cage Trust. Laura Kuhn, Executive Director.">Kuhn's Blog</a></li>
<li class="selected">Database of Works</li>
<li><a href="../events/events.html" title="Cage Related Events">Calendar of Events</a></li>
                        <li><a href="../reunion/index.html" title="Reunion">Reunion<span class="new"></span></a></li><br />
                        <li><a href="../empty.html" title="Empty Works">Empty Words<span></span></a></li><br />  
</ul>
</div>
  </div>
</div>
<div class="clear"></div>

<!--- begin main content --->
<div class="container_12">

<div class="grid_3"> <!--- left column --->
<table width="220px" border="0"  cellpadding="10" style="" class="tableTop">
  <tr>
    <td height="30" colspan="2" class="labelCell"  >Search</td>
  </tr>
  <tr>
   <td height="20px" colspan="2"  class="tableRegularCell" style="padding-top:15px; padding-bottom:15px; width:100%">
   <input type="text" id="stringSearch" placeholder="Search for a Title" maxlength="32"  /> 
     <button id="doSearch" title="GO" onClick="updateFilters()" value="GO" name="GO">Go</button>   
   </td>
  </tr>
  <tr>
  <td width="130" class="labelCell" style="background-color:#000;">Filter</td>
  <td width="50" align="center" class="labelCell" style="background-color:#575757;"><a href="javascript:resetSearch()"> Reset</a></td>  
  </tr>
  <tr>
   <td height="20px" colspan="2"  class="tableRegularCell" style="padding-top:15px; padding-bottom:6px; width:100%">
    <select name="length" onchange="updateFilters()" id="selectLength" style="width:170px; display:block;">
      <option value="0" label="Duration" selected="selected">Duration</option>
      <option value="1" label="< 10'">< 10'</option>
      <option value="2" label="10' - 19'">10' - 19'</option>
      <option value="3" label="20 - 29'">20 - 29'</option>
      <option value="4" label="> 30'" >> 30'</option>
    </select>   
   </td>
  </tr>
  <tr>
  <tr>
   <td height="20px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
    <select name="premiereYear" onchange="updateFilters()" id="selectPremiere" style="width:170px; display:block;">
      <option value="0" label="Premiere Date" selected="selected">Premiere Date</option>
      <option value="1" label="Before 1940" >Before 1940</option>
      <option value="2" label="1940 - 1949">1940 - 1949</option>
      <option value="3" label="1950 - 1959">1950 - 1959</option>
      <option value="4" label="1960 - 1969">1960 - 1969</option>
      <option value="5" label="1970 - 1979">1970 - 1979</option>
      <option value="6" label="1980 - 1989">1980 - 1989</option>
      <option value="7" label="After 1990">After 1990</option>
    </select>
   </td>
  </tr>
  <tr>
  <tr>
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
     <select name="manuscriptLocation" onchange="updateFilters()" id="selectManuscript"  style="width:170px; display:block;">
      <option value="0" label="Manuscript Location" selected="selected"> Manuscript Location</option>
      <cfoutput query="manuscriptLocations">
        <option value="#data#" label="#label#">#label#</option> 
      </cfoutput>
    </select>
   </td>
  </tr>
  <tr>
    <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
      <select name="ensembleType" onchange="updateFilters()" id="selectEnsembleType" style="width:170px; display:block;">
    	<option value="0" label="Ensemble Type" selected="selected">Ensemble Type</option>
        <cfoutput query="ensembleTypes">
        <option value="#data#" label="#label#">#label#</option>
        </cfoutput>
    </select>
   </td>
  </tr>
  <tr>
  
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
     <select name="instrumentType" onchange="updateFilters()" id="selectInstrumentType" style="width:170px; display:block;">
    	<option value="0" label="Instrument Type" selected="selected">Instrument Type</option>
        <cfoutput query="instrumentTypes">
        <option value="#data#" label="#label#">#label#</option>
        </cfoutput>
     </select>
   </td>
  </tr>
  <tr>
  
  <tr>
  
   <td height="35" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
     <select name="specificInstrument" onchange="updateFilters()" id="selectSpecificInstrument" style="width:170px; display:block;">
    	<option value="0" label="Specific Instrument" selected="selected">Specific Instrument</option>
        <cfoutput query="specificInstruments">
        <option value="#data#" label="#label#">#label#</option>
        </cfoutput>
     </select> 
   </td>
  </tr>
  <tr>
  
  <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:15px; padding-bottom:15px; width:100%; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;">
  <span style="font-family:Arial, Helvetica, sans-serif;font-size: 13px; ">Number of Players<br />
     <input  type="number" id="numberOfPlayers" placeholder="number" width="3"/><button id="doSearch" title="GO" onClick="updateFilters()" value="GO" name="GO">Go</button> <br />
    <p>
       <label>
         <input type="radio" name="radioNumber" value="1" id="radioNumber_0" checked>
         <small>Exactly this Number</small></label>
       <br>
       <label>
         <input type="radio" name="radioNumber" value="2" id="radioNumber_1">
         <small>Up to This Number</small></label>
       <br>
       <label>
         <input type="radio" name="radioNumber" value="3" id="radioNumber_2">
         <small>At Least this Number</small></label>
       <br>
    </p>
    </span>
   </td>
  </tr>
  <tr>
  
   <tr>
  
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:15px; padding-bottom:6px; width:100%">
     <select name="collaborators" onchange="updateFilters()" id="selectCollaborator" style="width:170px; display:block;">
    	<option value="0" label="Collaborator" selected="selected">Collaborator</option>
        <cfoutput query="collaborators">
        <option value="#data#" label="#label#">#label#</option>
        </cfoutput>
     </select>
   </td>
  </tr>
  <tr>
  
   <tr>
  
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
     <select name="cunningham" onchange="updateFilters()" id="selectCunningham" style="width:170px; display:block;">
    	<option value="0" label="Cunningham Related" selected="selected">Cunningham Related</option>
        <option value="1" label="Used by Cunningham">Used by Cunningham</option>
     </select> 
   </td>
  </tr>
  
   <tr>
  
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
    <select name="recordingExists" onchange="updateFilters()" id="selectRecording" style="width: 170px; display: block; ">
    	<option value="0" label="Recordings" selected="selected">Recordings</option>
         <option value="1" label="Recordings known">Recordings known</option>
        <option value="2" label="Recordings not known">Recordings not known</option>
        <option value="3" label="Reset - Show all works">Reset - Show all works</option>
     </select>
   </td>
  </tr>
  
   <tr>
  <!---
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
    <select name="published"  id="selectPublished" style="width:170px; display:block; color:#333" onchange="updateFilters()">
    	<option value="0" label="Published?" selected="selected">Published?</option>
         <option value="1" label="Published">Published</option>
        <option value="2" label="Not Published">Not Published</option>
        <option value="3" label="Reset - Show all works">Reset - Show all works</option>
     </select>  
   </td>
  </tr>
  --->
   <tr>
  
   <td height="15px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
    <span style="font-family:Arial, Helvetica, sans-serif;font-size: 13px; ">Display by Comp. Date:&nbsp;&nbsp;
    <input type="checkbox" name="checkByDate" id="checkByDate" >
    </span>
   </td>
  </tr>
  <tr>
  
   <td height="35px" colspan="2"  class="tableRegularCell" style="padding-top:1px; padding-bottom:6px; width:100%">
   &nbsp;&nbsp;

   </td>
  </tr>
  
</table>


</div> <!--- end grid 3 end left column--->
<div class="grid_8">
<table width="100%" border="0"  cellpadding="10" style="" class="tableTop">
  <tr>
    <td height="30" class="labelCell" >Title</td>
  </tr>
</table>
 <div class="content" id="contentCenter" style="overflow:scroll;">

    <div id="loading" >
      <table width="100%" id="loadingTable">
  		<tr class="danceRow">
        <td class="tableRegularCell" ><i>Please Wait...</i></td>
        </tr>
       </table> 
    </div>
	
	      <table id="worksTable" width="100%" border="-2px"  cellpadding="10" >
  		
        
        </table>
    <!-- end .content --></div>

</div> <!--- end grid 8 --->

</div>
<div class="clear"></div>

	    <!-- SHARE BUTTON -->
    
    	<div id="share">
            <div class="addthis_toolbox">
    <div class="custom_hover">
        <span class="custom_button" style="font-weight: normal;">+ Share</span>
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
</div>          

      </div>
    
    </div><!-- END SHARE -->

<script type="text/javascript">
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  </script>
<script type="text/javascript">
  try {
  var pageTracker = _gat._getTracker("UA-11095114-1");
  pageTracker._trackPageview();
  } catch(err) {}</script>

<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=YOUR-ACCOUNT-ID"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
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

</body>

<script type="text/javascript">
	$(document).ready(function(e) {
		$('#checkByDate').change(function(event){
			updateFilters();
		});
		 $("#loading").hide();
		 $('#detailTable').hide();	
       getFilteredWorks(length,premiereYear,manuscriptLocation,ensembleType,instrumentType,specificInstrument,searchString,collaborators,recordings,published,numberString,numberLimit,cunningham);
	   $('td').click(function(event){
		//alert($(this).attr('id')); 
	   	$(this).toggleClass("highlight");
	    });
    });
	</script>
	
</html>