<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<title>John Cage :: 2012 Centennial :: Latest News</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="The official site for information about the life and works of John Cage, administered by the John Cage Trust." />
    <meta name="keywords" content="John Cage, John Cage Trust, Laura Kuhn, Cage Discography, John Cage Works List, 2012 Centennial, John Cage Folksonomy, Bard College" />
    <meta name="Robots" content="index, follow" />
    <meta name="Robots" content="ALL" />
    <meta name="Rating" content="global" />
    <meta name="Distribution" content="general" />
    <meta http-equiv="Revisit" content="7 Days">	
    <link rel="home" href="http://www.johncage.org/" />
    <link rel="Shortcut Icon" href="favicon.ico" />
    
    <!-- STYLESHEETS -->
    
    <link rel="stylesheet" type="text/css" media="all" href="../css/reset.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../css/text.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../css/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../css/master.css" />
    

	<cfquery name="getNews" datasource="cage">
    SELECT     id, NewsDate, NewsHeadline, NewsText
	FROM         CageNews
	ORDER BY NewsDate DESC
    
    </cfquery>

</head>

<body>

	<div class="container_12">

        <!-- NAVIGATION -->
        
        <div id="nav">
                <div class="grid_2 prefix_4">
                    <a href="/" class="selected">John Cage</a>
        </div>
                <div class="grid_3">
                
                    <ul>
                    
                      <li class="selected">2012 Centennial</li><br />
                      <li><a href="../preparedPiano/sonatas_and_interludes.html">Sonatas and Interludes <span class="new">New</span></a></li><br />
                  <li><a href="../cagePiano.html">Prepared Piano App <span class="new">New</span></a></li>
                  <br />
                      <li><a href="../autobiographical_statement.html" title="An autobiographical statement of John Cage.">Autobiographical Statement</a></li><br />
                      <li><a href="../about.html" title="Learn more about the John Cage Trust.">The John Cage Trust</a></li><br />
                      <li><a href="../indeterminacy.html" title="Eddie Kohler's beautiful application devoted to John Cage's Indeterminacy: New Aspect of Form in Instrumental and Electronic Music.">Indeterminacy</a></li><br />
                      <li><a href="http://www.johncage.org/autobio/JohnCageFolksonomy.html" target="_blank" class="external" title="Announcing the John Cage Folksonomy, an expandable roster of friends and acquaintances of John Cage to which you can contribute.">Folksonomy</a></li><br />
                      <li><a href="../blog.html" title="Official blog of the John Cage Trust. Laura Kuhn, Executive Director.">Kuhn's Blog</a></li><br />
                      <li><a href="../pp/John-Cage-Works.cfm" title="Search through the Cage Database.">Cage Database <span class="new">Beta</span></a></li><br />
                    
                    </ul>
                    
                </div>
                    
                <div class="grid_3">
                    
                      <ul>
                      
                        <li><a href="../2012" title="Learn more about the 2012 Centennial">About</a></li><br />
                        <li class="selected">Latest News</li><br />
                        <li><a href="events.html" title="View and Add Events">Events Listings</a></li><br />
                        <li><a href="birthday_wishes/" title="View and Add Birthday Wishes">Birthday Wishes</a></li><br />
                        <li><a href="useful_contacts.html" title="Got questions? Need help? Get in touch with us.">Useful Contacts</a></li><br />
                      
                      </ul>
                       
                </div>
        
          </div><!-- END NAVIGATION -->
         
         <!-- CONTENT -->
          
         <div class="clear">&nbsp;</div>
            
         <div class="grid_4">&nbsp;</div>
              
         <div id="column" class="grid_8">   
                
         <div id="content_latest_news">
         
          <cfoutput query="getNews" >
          <h1>#getNews.NewsHeadline#</h1>
            <span class="date">#DateFormat(getNews.NewsDate,"dd mmm yyyy")#</span>
              <p>#getNews.NewsText#</p>
           <hr />
            </cfoutput>
         
          </div>
    
</div><!-- END CONTENT -->

    </div><!-- END CONTAINER 12 -->


	    <!-- SHARE BUTTON -->
    
    	<div id="share">
            <div class="addthis_toolbox">
    <div class="custom_hover">
        <span class="custom_button">+ Share</span>
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
    
    
    <!-- SCRIPTS -->

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
  
  <!-- END SCRIPTS -->

</body>
</html>