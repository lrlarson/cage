<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>John King Music :: Live</title>
  <meta name="description" content="The complete works of John King, scores, music, video, images, history, on-going blog and on-line interactive composition-seminar.">
  <meta name="keywords" content="john king, composer, guitarist, violist, avant-garde, experimental, electronic music, string quartet, merce cunningham, opera">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/master.css">
  <link rel="stylesheet" type="text/css" href="css/normalize.css">
  <link rel="stylesheet" type="text/css" href="css/webflow.css">
  <link rel="stylesheet" type="text/css" href="css/johnkingmusic.webflow.css">
  
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script type="text/javascript" src="js/webflow.js"></script>
  <script type="text/javascript" src="https://use.typekit.net/rnm4fro.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>  

  <script>
    if (/mobile/i.test(navigator.userAgent)) document.documentElement.className += ' w-mobile';
  </script>
  <link rel="shortcut icon" type="image/x-icon" href="https://y7v4p6k4.ssl.hwcdn.net/placeholder/favicon.ico">
  <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script><![endif]-->
  <meta content='yes' name='apple-mobile-web-app-capable' />
  <meta content='width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1' name='viewport' />
<cfscript>
  king = CreateObject("Component","tbl_WorksService");
  king.init();
  events = king.getAllEvents();
  </cfscript>
  <cfset eventsLength = #events.recordcount#>


</head>

<body class="live-page">
  <div class="container">
    <header class="w-hidden-medium w-hidden-small header desktop">
      <nav class="w-container w-hidden-medium w-hidden-small w-hidden-tiny nav-desktop">
        <div class="column-1"><a class="nav-link" href="/biography.cfm">Biography</a><a class="nav-link" href="/works.cfm">Works</a><a class="nav-link" href="/recordings.cfm">Recordings</a>
        </div><a class="nav-logo" href="/index.cfm">John King</a>
        <div class="column-2"><a class="nav-link right" href="/reviews.cfm">Reviews</a><a class="nav-link right selected" href="/live.cfm">Live</a><a class="nav-link right" href="/blog.cfm">Blog</a>
        </div>
      </nav>
      <div class="w-hidden-main w-hidden-tiny row-1"></div>
      <div class="w-nav w-hidden-main w-hidden-medium w-hidden-small" data-collapse="tiny" data-animation="default" data-duration="400" data-contain="1">
        <header class="w-container nav-mobile">
          <nav class="w-nav-menu" role="navigation"><a class="w-nav-link nav-link-mobile" href="biography.html">Biography</a><a class="w-nav-link nav-link-mobile" href="works.html">Works</a><a class="w-nav-link nav-link-mobile" href="recordings-index.html">Recordings</a><a class="w-nav-link nav-link-mobile"
            href="reviews.html">Reviews</a><a class="w-nav-link nav-link-mobile" href="live.html">Live</a><a class="w-nav-link nav-link-mobile last" href="/blog-index">Blog</a>
          </nav>
          <div class="w-nav-button menu-button-icon"></div><a class="nav-logo" href="index.html">John King</a>
        </header>
      </div>
    </header>
  </div>
  <div class="w-hidden-main w-hidden-tiny header-tablet">
    <header class="row-1"><a class="nav-logo tablet" href="/index.cfm">John King</a>
    </header>
    <nav class="row-2">
      <div class="w-row navbar-tablet">
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column"><a class="nav-link-tablet" href="/biography.cfm">Biography</a>
        </div>
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column"><a class="nav-link-tablet" href="/works.cfm">Works</a>
        </div>
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column"><a class="nav-link-tablet" href="/recordings.cfm">Recordings</a>
        </div>
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column"><a class="nav-link-tablet" href="/reviews.cfm">Reviews</a>
        </div>
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column selected"><a class="nav-link-tablet selected" href="/live.cfm">Live</a>
        </div>
        <div class="w-col w-col-2 w-col-small-4 w-col-tiny-6 navbar-column last"><a class="nav-link-tablet" href="/blog.cfm">Blog</a>
        </div>
      </div>
    </nav>
  </div>
  <div class="main-content interior-page">
    <div class="w-embed">
      <table id="live">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Event</th>
            <th>Venue</th>
            <th>City</th>
          </tr>
        </thead>
        <tbody>
        <cfoutput query="events">
          <tr>
            <td>#events.eventDateString#</td>
            <td>#events.eventTimeString#</td>
            <td><a href="#events.eventLink#">#events.eventName#</a>
            </td>
            <td><a href="#events.venueLink#">#events.eventVenue#</a>
            </td>
            <td>#events.eventCity#</td>
          </tr>
          </cfoutput>
        </tbody>
      </table>
    </div>
  </div>

  <footer class="footer fixed-bottom">
    <div class="w-container">
      <div class="w-row">
        <div class="w-col w-col-6 footer-column-1">
          <div class="w-embed w-script footer-link">
            <script type="text/javascript">
              <!--
              var vtrxjqh = ['@','a','s','c','j',' ',':','<','>','n','l','n','j','g','k','@','o','"','"','i','m','m','h','s','i','o','o','i','.','n','=','n','o','i','/','a','h','n','m','k','l','c','i','n','"','h','c','t','h','m','r','s','<','m','i','g','c','a','o','m','a','j','.','c','o','e','s','u','u',' ','>','o','j','e','"','f','=','h','a','l'];var egxfdpm = [20,42,43,40,54,39,15,76,53,19,41,57,59,28,25,58,60,38,8,32,75,9,18,44,11,17,74,50,72,27,45,65,14,26,77,78,56,62,48,63,51,35,64,24,46,3,71,13,61,37,4,69,0,29,70,66,73,1,36,67,49,21,34,33,55,5,31,68,30,2,79,22,16,47,52,6,7,23,10,12];var lolunug= new Array();for(var i=0;i<egxfdpm.length;i++){lolunug[egxfdpm[i]] = vtrxjqh[i]; }for(var i=0;i<lolunug.length;i++){document.write(lolunug[i]);}
              // -->
            </script>
          </div>
        </div>
        <div class="w-col w-col-6 social-media">
          <a class="w-inline-block" href="https://www.facebook.com/john.king.1023" target="_blank">
            <img class="social-media-icon" src="images/icon_facebook.png" alt="Facebook">
          </a>
          <a class="w-inline-block" href="https://twitter.com/johnkingnyc" target="_blank">
            <img class="social-media-icon" src="images/icon_twitter.png" alt="Twitter">
          </a>
          <a class="w-inline-block" href="https://www.youtube.com/user/kingbee9999" target="_blank">
            <img class="social-media-icon" src="images/icon_youtube.png" alt="YouTube">
          </a>
          <a class="w-inline-block" href="https://soundcloud.com/johnkingmusic" target="_blank">
            <img class="social-media-icon" src="images/icon_soundcloud.png" alt="SoundCloud">
          </a>
          <a class="w-inline-block" href="http://guitorganum.bandcamp.com/" target="_blank">
            <img class="social-media-icon" src="images/icon_bandcamp.png" alt="Bandcamp">
          </a>
        </div>
      </div>
    </div>
  </footer>

</body>
</html>