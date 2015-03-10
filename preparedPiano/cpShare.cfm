<!DOCTYPE HTML>
<html>
<cfparam type="string" name="audio" default="B6FA9813-BFCA-A3D7-04D7DE350B93958B">
<head>
<meta property="og:title" content="Music recorded with the CagePiano App" />
<meta property="og:description" content="The CagePiano app for iOS and Android lets you play prepared piano sounds created using John Cage's original collection of preparations. This recording was created in the app and shared to the cloud for playing." />
<link rel="image_src" href="http://www.johncage.org/preparedPiano/appicon144.png" />
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="assets/css/reset.css" />
<link type="text/css" rel="stylesheet" href="assets/css/960.css" />
<link rel="stylesheet" href="skin/circle.skin/circle.player.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jquery.transform.js"></script>
<script type="text/javascript" src="js/jquery.grab.js"></script>
<script type="text/javascript" src="js/mod.csstransforms.min.js"></script>
<script type="text/javascript" src="js/circle.player.js"></script>

<style>
body {
	margin:50px 0px; padding:0px;
	text-align:center;
	font-family: Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif;
	background:url(./cageShareBack.jpg) left 0px no-repeat;
	}

.container-12{ width:1020px; height:900px; margin:0 auto; }

#mainPlayerSPan{ 
	position:absolute;
left:350px;
top:335px;	}

#dataSpan{ 
	position:absolute;
left:551px;
top:335px; 
background-color:#333; width:300px;
height:200px;
padding-left:3px; 

}
#dataSpan #title{font-size:16px; color:#FFF; text-align:left; padding-left:3px; 
	
}
#date {font-size:14px; color:#999; text-align:left;padding-left:3px; }

#share_button{ position:absolute; left:160px; top:160px;
}

	/* This is the logo link clickable area */

#logo-zone {
	position: absolute;
	top: 7px;
	left: 763px;
	height: 29px;
	width: 129px;
	
}
</style>
<title>CagePiano Play and Share</title>
<cfquery name="getFileName" datasource="cage">
SELECT     fileName, date,title
FROM         tbl_PianoUploads
WHERE     (UUID = N'#audio#' )
</cfquery>
<script type='text/javascript' src='./jwplayer/jwplayer.js'></script>

<script type="text/javascript">
//<![CDATA[


$(document).ready(function(){



	var myCirclePlayer = new CirclePlayer("#jquery_jplayer_1",
	{
		<cfoutput>
		mp3:"http://www.johncage.org/preparedPiano/uploads/#getFileName.fileName#"
		</cfoutput>
	},
	 {
		cssSelectorAncestor: "#cp_container_1",
		supplied: "mp3",
		swfPath: "js",
		wmode: "window",
		solution:"flash,html"
	});
});
//]]>
</script>

</head>

<body>

<div class="container-12">



<!--- AddThis Button BEGIN 
<p>Follow Us</p>
<!---
<div class="addthis_toolbox addthis_32x32_style addthis_default_style">
<a class="addthis_button_facebook_follow" addthis:userid="johncagetrust"></a>
<a class="addthis_button_twitter_follow" addthis:userid="johncagetrust"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=jackfreud"></script>
<!-- AddThis Button END -->

--->
<p>
<p>
<p>
--->

<a id="logo-zone" href="http://itunes.apple.com/us/app/john-cage-piano/id553864918?ls=1&mt=8"></a>

<span id="mainPlayerSPan">
<div id="jquery_jplayer_1" class="cp-jplayer"></div>

			<!-- The container for the interface can go where you want to display it. Show and hide it as you need. -->

			<div id="cp_container_1" class="cp-container">
				<div class="cp-buffer-holder"> <!-- .cp-gt50 only needed when buffer is > than 50% -->
					<div class="cp-buffer-1"></div>
					<div class="cp-buffer-2"></div>
				</div>
				<div class="cp-progress-holder"> <!-- .cp-gt50 only needed when progress is > than 50% -->
					<div class="cp-progress-1"></div>
					<div class="cp-progress-2"></div>
				</div>
				<div class="cp-circle-control"></div>
				<ul class="cp-controls">
					<li><a href="#" class="cp-play" tabindex="1">play</a></li>
					<li><a href="#" class="cp-pause" style="display:none;" tabindex="1">pause</a></li> <!-- Needs the inline style here, or jQuery.show() uses display:inline instead of display:block -->
				</ul>
			</div>

</span>
<cfoutput>
<p align="left">
<span id="dataSpan">

<span id="title">

#getFileName.title#

<br />
</span>
<span  id="date">

#dateformat(getFilename.date,"mmmm dd, yyyy")#

</span>
<br />

<script type="text/javascript">
var addthis_config = {
     pubid: "jackfreud"
}
</script>
<a href="http://www.addthis.com/bookmark.php?v=250" 
        class="addthis_button">
<img src="assets/images/shareButton.gif" id="share_button" >
</a>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
</span>
</p>
</cfoutput>

</div>
<cfoutput>

</cfoutput>


</body>
</html>
