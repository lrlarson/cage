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
     <link rel="stylesheet" type="text/css" href="css/typeahead.css" />

   
  <cfscript>
cageData = CreateObject("Component","data/cageData");
cageData.init();
titles = cageData.getTitles();
authorList = cageData.getAuthors();
publisherList = cageData.getPublishers();
editorList = cageData.getEditors();
translatorList = cageData.getTranslators();
keywordList = cageData.getKeywords();
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
        <div class="grid_4" style="background-color: white;">
            <table border="0" cellpadding="10" class="tableTop">
                <tr>
                    <td width="177" height="30" class="labelCell" style="background-color:#000; color: white;">Search by</td>
                    <td width="50" class="labelCell" style="background-color:#575757; color: white; text-align: center;"><a href="javascript:reset();">Reset</a></td>
                </tr>
                
                

                <tr>
                    <td height="50px" colspan="2" class="tableRegularCell" >
                     <select name="selectTitles" id="selectTitles" onChange="handleSearchChange(event)">
                          <option selected value="">By Title</option>
                          <option value="">All Titles</option>
                          <cfoutput query="titles">
                          <option value="#label#">#label#</option>
                          </cfoutput>                        
                          </select>
                    </td>
                </tr>
                 <tr>
                    <td height="50px" colspan="2" class="tableRegularCell" >
                     <select name="selectKeyword" id="selectKeyword" onChange="handleSearchChange(event)">
                          <option selected value="-1">Search by Keywords</option>
                          <option value="-1">All Keywords</option>
                          <cfoutput query="keywordList">
                          <option value="#data#">#label#</option>
                          </cfoutput>                        
                          </select>
                    </td>
                </tr>
                 <tr>
                  <td height="50px" colspan="2" class="tableRegularCell">
                 
                  <select name="selectDate" id="selectDate" onChange="handleSearchChange(event)">
                   <option selected value="-1">Date Published</option>
                  <option value="-1">All Titles</option>
                  <option value="1"> before 1940</option>
                  <option value="2"> 1940 - 1949</option>
                  <option value="3"> 1950 - 1959</option>
                  <option value="4"> 1960 - 1969</option>
                  <option value="5"> 1970 - 1979</option>
                  <option value="6"> 1980 - 1989</option>
                  <option value="7"> after 1990</option>
					
                  </select>
                  
                </tr>
				 <tr>
                    <td height="50px" colspan="2" class="tableRegularCell" id="stringSeachBox" ><input class="stringSearch" maxlength="32" placeholder="Search by Text String" type="text" id="searchInput"><button class="apply" name="GO" title="GO" value="GO" onClick="handleSearchChange(event)">Apply</button></td>
                </tr>
                <tr>
                    <td height="50px" colspan="2" class="tableRegularCell" id="authorList" ><input class="stringSearch typeahead" maxlength="32" placeholder="Author(s)" type="text" id="searchAuthor"><button class="apply" name="GO" title="GO" value="GO" onClick="handleSearchChange(event)">Apply</button></td>
                </tr>
				               
                <tr>
                  <td height="50px" colspan="2" class="tableRegularCell" id="publisherList"><input class="stringSearch typeahead" maxlength="32" placeholder="Publisher" type="text" id="publisher"><button class="apply" name="GO" title="GO" value="GO" onClick="handleSearchChange(event)">Apply</button></td>
                </tr>
                
               
                <tr>
                  <td height="50px" colspan="2" class="tableRegularCell" id="editorList"><input class="stringSearch typeahead" maxlength="32" placeholder="Editor(s)" type="text" id="editor"><button class="apply" name="GO" title="GO" value="GO" onClick="handleSearchChange(event)">Apply</button></td>
                </tr>
                <tr>
                  <td height="50px" colspan="2" class="tableRegularCell" id="translatorList"><input class="stringSearch typeahead" maxlength="32" placeholder="Translator(s)" type="text" id="translator"><button class="apply" name="GO" title="GO" value="GO" onClick="handleSearchChange(event)">Apply</button></td>
                </tr>
            </table>
        </div>

<div class="grid_8">

  <table width="100%" border="0"  cellpadding="10" style="" class="tableTop">
  		<tr><td height="30" class="labelCell" id="titlesText" >Titles</td></tr>
  </table>

 <div class="content" id="showBooks">
	<table width="100%" id="booksDisplay" ><!-- insert here --></table> 
    <script id="books-template" type="x-handlebars-template">
	{{#each data}}
		<tr>
        <td class="tableRegularCell" ><a href="library_entry.cfm?id={{id}}">{{title}}</a>
		</td>
		  <td width="200" align="right" class="tableRegularCell" >
		  <img src="http://www.johncage.org/bookImages/{{coverimage}}" width="100px" height="150px">
		  </td>
		</tr>
	{{/each}} 	
	</script>	
	
</div><!-- end .content -->
<div class="content" id="hideBooks">
	<img src="loading1.gif" width="100%" >
</div>
</div>

    <div class="clear"></div>
    
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
    
    
     <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
    <script src="js/Handlebars.js"></script>
    <script src="js/jquery.serializecfjson-0.2.min.js"></script>
    <script src="js/typeahead.bundle.js"></script>
    <script src="js/cage.js"></script>
    
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
    
	
   <script>
   var authors = 
		[
                    <cfoutput query="authorList">
					"#author#",
					 </cfoutput>
					
		];
		
		
		$('#authorList .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'authors',
		  displayKey: 'value',
		  source: substringMatcher(authors)
		});
		
	var publishers =
	
		[
                    <cfoutput query="publisherList">
					"#Publisher#",
					 </cfoutput>
					
		];
		
		$('#publisherList .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'publishers',
		  displayKey: 'value',
		  source: substringMatcher(publishers)
		});
		
		var editors =
	
		[
                    <cfoutput query="editorList">
					"#Editor#",
					 </cfoutput>
					
		];
		
		$('#editorList .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'editors',
		  displayKey: 'value',
		  source: substringMatcher(editors)
		});
		
		var translators =
	
		[
                    <cfoutput query="translatorList">
					"#Translators#",
					 </cfoutput>
					
		];
		
		$('#translatorList .typeahead').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'translators',
		  displayKey: 'value',
		  source: substringMatcher(translators)
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
	
	 $( document ).ready(function() {
		 
		 
		handlePageLoad(); 
	 });

    </script>
</body>
</html>