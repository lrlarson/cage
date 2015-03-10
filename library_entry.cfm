<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>John Cage Library</title>
        <meta name="description" content="The official site for information about the life and works of John Cage, administered by the John Cage Trust." />
    <meta name="keywords" content="John Cage, John Cage Trust, Laura Kuhn, Cage Discography, John Cage Works List, John Cage Library, John Cage Folksonomy, Bard College" />
    <meta name="Robots" content="index, follow" />
    <meta name="Robots" content="ALL" />
    <meta name="Rating" content="global" />
    <meta name="Distribution" content="general" />
    <link rel="home" href="http://www.johncage.org/" />
	
    <link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/text.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/960.css" />
	<link rel="stylesheet" type="text/css" media="all" href="css/master.css" />
	<link type="text/css" rel="stylesheet" href="css/library.css" />
    <link type="text/css" rel="stylesheet" href="css/jquery-ui.css" />

    <script src="js/jquery-1.10.2.js"></script>
	<script src="js/jquery-ui.js"></script>
    
    <cfparam name="id" default="49">
    
    <cfscript>
		cageData = CreateObject("Component","data/cageData");
		cageData.init();
		bookDetails = cageData.getBookDetails(#id#);
	</cfscript>
</head>

<body>
    
    <div class="container_12">

    <!-- NAVIGATION -->
    
      <div id="nav">
            <div class="grid_2 prefix_4">
                <a href="http://www.johncage.org" style=
                "font-style: italic; color: #000;">John Cage</a>
            </div>

            <div class="grid_3">
                <ul class="navigation">
                    <li><a href="http://www.johncage.org/2012">2012 Centennial Archives</a></li>
                    <li><a href="http://www.johncage.org/4_33.html">4&#8242;33&#8243;App</a></li>
                    <li><a href="http://www.johncage.org/preparedPiano/sonatas_and_interludes.html">Sonatas and Interludes</a></li>
                    <li><a href="http://www.johncage.org/cagePiano.html">Prepared Piano App</a></li>
                    <li><a href="http://www.johncage.org/autobiographical_statement.html" title="An autobiographical statement of John Cage.">Autobiographical Statement</a></li>
                    <li><a href="http://www.johncage.org/about.html" title="Learn more about the John Cage Trust.">About the John Cage Trust</a></li>
                   <li><a href="http://www.johncage.org/indeterminacy.html" title="Eddie Kohler's beautiful application devoted to John Cage's Indeterminacy: New Aspect of Form in Instrumental and Electronic Music.">Indeterminacy</a></li>
                    <li> <a class="external" href="http://www.johncage.org/autobio/JohnCageFolksonomy.html" target="_blank" title="Announcing the John Cage Folksonomy, an expandable roster of friends and acquaintances of John Cage to which you can contribute.">Folksonomy</a></li>
                    <li><a href="http://www.johncage.org/blog.html" title= "Official blog of the John Cage Trust. Laura Kuhn, Executive Director.">Kuhn's Blog</a></li>
                    <li><a href="http://johncage.org/pp/John-Cage-Works.cfm" title="Search through the Cage Database.">Database of Works</a></li>
					<li class="selected">John Cage Library</li>
                    <li><a href="../2012/events.html" title="Cage Related Events">Calendar of Events</a></li>
                    <li><a href="../reunion/index.html" title="Reunion">Reunion<span class="new"></span></a></li>
                    <li><a href="../empty.html" title="Empty Works">Empty Words<span></span></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="clear"></div><br>
    
    <!-- CONTENT -->

<div class="container_12">

<div class="grid_8">
	<cfoutput>
  <table width="100%" border="0"  cellpadding="0" cellspacing="0" class="tableTop" style="">
  		<tr><td height="30" class="labelCell" >&##8592; <a href="library.cfm">Back to Library Index</a></td></tr>
  		<tr>
  		  <td valign="top" class="tableRegularCell" ><table width="100%" >
  		    <tr>
  		      <td colspan="4" class="tableRegularCell" ><h1>#bookDetails.title#</h1></td>
	        </tr>
  		    <tr>
  		      <td width="163" class="tableLabelCell" >Author(s)</td>
  		      <td colspan="3" class="tableRegularCell" >#bookDetails.Author#</td>
	        </tr>
  		    <tr>
  		      <td class="tableLabelCell" >Editor(s)</td>
  		      <td colspan="3" class="tableRegularCell" >#bookDetails.Editor#</td>
	        </tr>
  		    <tr>
  		      <td width="163" class="tableLabelCell" ><span class="entry-label">Translator(s)</span></td>
  		      <td width="313" class="tableRegularCell">#bookDetails.Translators#</td>
  		      <td width="89" class="tableLabelCell">Language</td>
  		      <td width="90" class="tableRegularCell">#bookDetails.language#</td>
	        </tr>
  		    <tr>
  		      <td width="163" class="tableLabelCell">Publisher</td>
  		      <td width="313" class="tableRegularCell">#bookDetails.Publisher#</td>
  		      <td width="89" class="tableLabelCell">Pub. Date</td>
  		      <td width="90" class="tableRegularCell">#bookDetails.pubDate#</td>
	        </tr>
  		    <tr>
  		      <td class="tableLabelCell">Annotations</td>
  		      <td colspan="3" class="tableRegularCell" >#bookDetails.Annotations#</td>
	        </tr>
  		    <tr>
  		      <td class="tableLabelCell">Book Signed</td>
  		      <td colspan="3" class="tableRegularCell" >#bookDetails.signed#</td>
	        </tr>
             <tr>
  		      <td class="tableLabelCell">Notes</td>
  		      <td colspan="3" class="tableRegularCell">#bookDetails.notes#</td>
	        </tr>
  		    <tr>
  		      <td class="tableLabelCell">Author Detail</td>
  		      <td colspan="3" class="tableRegularCell">#bookDetails.detailNotes#</td>
	        </tr>
  		    <tr>
  		      <td class="tableLabelCell">ISBN</td>
  		      <td colspan="3" class="tableRegularCell">#bookDetails.ISBN#</td>
	        </tr>
	      </table></td>
    </tr>
  </table>
  
 </div> 
<div class="grid_3" >
<div class="content" style="background-color: ##fff; width: 330px; height:340px;">
<table width="330px" border="0"  cellpadding="10" style="" class="tableTop">
  <tr id="recordingHeader">
  	
    <td class="tableRegularCell" height="30" ><img src="http://www.johncage.org/bookImages/#bookDetails.coverImage#" width="300" height="450"/></td>
   
  </tr>
  </table>
</cfoutput>
 </div>
 </div>
  </div>
  
  <!-- end .content -->
    
<!-- SHARE BUTTON -->

    <div id="share">
        <div class="addthis_toolbox">
            <div class="custom_hover">
                <span class="custom_button" style="font-weight: normal;">+
                Share</span>
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
                    <a class="addthis_button_twitter">Twitter</a> <a class=
                    "addthis_button_facebook">Facebook</a> <a class=
                    "addthis_button_myspace">MySpace</a>
                </div>

                <div class="column2">
                    <a class="addthis_button_delicious">Delicous</a> <a class=
                    "addthis_button_stumbleupon">Stumble</a> <a class=
                    "addthis_button_digg">Digg</a>
                </div>

                <div class="clear"></div>

                <div class="more">
                    <a class="addthis_button_expanded">More...</a>
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
    } catch(err) {}
    </script>
    
    <script src="http://s7.addthis.com/js/250/addthis_widget.js#username=YOUR-ACCOUNT-ID"ntype="text/javascript"></script>
    
	
    
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
</html>