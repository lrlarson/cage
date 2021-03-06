<cfcomponent>
 <cffunction name="init" access="public" returntype="cageData">
	<cfreturn this />	
	</cffunction>


<cffunction name="getBookDetails" access="remote"  returntype="Any" >
	<cfargument name="id" required="true" type="numeric"  >
	<cfquery name="bookDetails" datasource="cageWebUSer" >
		SELECT     ID, [Book Title] AS title, recordID, Author, Editor, Translators, Type, Publisher, [Pub Date] AS pubDate, [No.] AS number, [Vol.] AS volume, Edition, genre, 
                      [Book Signed] AS signed, Message, Condition, [Condition Notes] AS conditionNotes, [Duplicate Copies] AS dupCopies, [Duplicate Detail], Annotations, 
                      [Type of Annotation] AS typeAnnotation, Keywords, ISBN, Cover_Image, Notes, [Call Number] AS callNumber, shelved, updated, needToFind, internalNotes, 
                      last_edit_date, last_edit_by, tempISBN, tempCallNumber, language, detailNotes, processed, coverImage
		FROM         tbl_CageLibrary
		WHERE     (ID = #id#)
	</cfquery>
	<cfreturn bookDetails>
</cffunction>



<cffunction name="searchTitles" access="remote" returntype="Any" >
	<cfargument name="title" required="true" default="" type="string" >
	<cfargument name="keyword" required="true" default="-1" type="numeric" >
	<cfargument name="publishDate" required="true" default="-1" type="numeric" >
	<cfargument name="searchString" required="true" default="" type="string" >
	<cfargument name="author" required="true" default="" type="string" >
	<cfargument name="publisher" required="true" default="" type="string" >
	<cfargument name="editor" required="true" default="" type="string" >
	<cfargument name="translator" required="true" default="" type="string" >
	
	<cfquery name="searchTitles" datasource="cageWebUSer" >
		SELECT  [ID]
      ,[Book Title] as Title
      ,[recordID]
      ,[Author]
      ,[Editor]
      ,[Translators]
      ,[Type]
      ,[Publisher]
      ,[Pub Date]
      ,[No.]
      ,[Vol.]
      ,[Edition]
      ,[genre]
      ,[Book Signed]
      ,[Message]
      ,[Condition]
      ,[Condition Notes]
      ,[Duplicate Copies]
      ,[Duplicate Detail]
      ,[Annotations]
      ,[Type of Annotation]
      ,[Keywords]
      ,[ISBN]
      ,[Cover_Image]
      ,[Notes]
      ,[Call Number]
      ,[imageFileName]
      ,[shelved]
      ,[updated]
      ,[needToFind]
      ,[internalNotes]
      ,[last_edit_date]
      ,[last_edit_by]
      ,[tempISBN]
      ,[tempCallNumber]
      ,[language]
      ,[detailNotes]
      ,[processed]
      ,[coverImage]
  FROM [Cage].[dbo].[tbl_CageLibrary]
  where id > 0
  <cfif title NEQ ''>
  	AND [Book Title] = '#title#'
  </cfif>	
  
  <cfif publishDate NEQ -1>
  		<cfswitch expression="#publishDate#" >
  			<cfcase value=1>
  				AND [Pub Date] < 1940 AND [Pub Date] <> ''
  			</cfcase>
  			<cfcase value="2" >
  				AND [Pub Date] > 1939 AND [Pub Date] < 1949
  			</cfcase>
  			<cfcase value="3" >
  				AND [Pub Date] > 1949 AND [Pub Date] < 1959
  			</cfcase>
  			<cfcase value="4" >
  				AND [Pub Date] > 1959 AND [Pub Date] < 1969
  			</cfcase>
  			<cfcase value="5" >
  				AND [Pub Date] > 1969 AND [Pub Date] < 1979
  			</cfcase>
  			<cfcase value="6" >
  				AND [Pub Date] > 1979 AND [Pub Date] < 1989
  			</cfcase>
  			<cfcase value="7" >
  				AND [Pub Date] > 1989
  			</cfcase>			
  		</cfswitch>
  </cfif>
  
  <cfif searchString NEQ ''>
  	AND 
  	(
  	 ([Book Title] LIKE N'%#searchString#%') OR
                      (Author LIKE N'%#searchString#%') OR
                      (Editor LIKE N'%#searchString#%') OR
                      (Translators LIKE N'%#searchString#%') OR
                      (Publisher LIKE N'%#searchString#%') OR
                      (detailNotes LIKE N'%#searchString#%') OR
                      (Notes LIKE N'%#searchString#%')
  		
  	)
  </cfif>	
  
  <cfif author NEQ ''>
  	AND Author = '#author#'
  </cfif>	
  
  <cfif publisher NEQ ''>
  	And Publisher = '#publisher#'	
  </cfif>
    <cfif editor NEQ ''>
  	And Editor = '#editor#'	
  </cfif>
  <cfif translator NEQ ''>
  	And Translators = '#translator#'	
  </cfif>
  
  order by Title
  
  
	</cfquery>
	
	
	
	<cfreturn searchTitles>
</cffunction>


<cffunction name="getAllTitles" access="remote"  returntype="Any" >
	<cfquery name="searchTitles" datasource="cageWebUSer" >
		SELECT  [ID]
      ,[Book Title] as Title
      ,[recordID]
      ,[Author]
      ,[Editor]
      ,[Translators]
      ,[Type]
      ,[Publisher]
      ,[Pub Date]
      ,[No.]
      ,[Vol.]
      ,[Edition]
      ,[genre]
      ,[Book Signed]
      ,[Message]
      ,[Condition]
      ,[Condition Notes]
      ,[Duplicate Copies]
      ,[Duplicate Detail]
      ,[Annotations]
      ,[Type of Annotation]
      ,[Keywords]
      ,[ISBN]
      ,[Cover_Image]
      ,[Notes]
      ,[Call Number]
      ,[imageFileName]
      ,[shelved]
      ,[updated]
      ,[needToFind]
      ,[internalNotes]
      ,[last_edit_date]
      ,[last_edit_by]
      ,[tempISBN]
      ,[tempCallNumber]
      ,[language]
      ,[detailNotes]
      ,[processed]
      ,[coverImage]
  FROM [Cage].[dbo].[tbl_CageLibrary]	
  order by Title
	</cfquery>
	<cfreturn searchTitles>
</cffunction>

<cffunction name="getRandomTitles" access="remote"  returntype="Any" >
	<cfquery name="searchTitles" datasource="cageWebUSer" >
	SELECT TOP 10 [ID]
      ,[Book Title] as Title
      ,NEWID() AS row
      ,[recordID]
      ,[Author]
      ,[Editor]
      ,[Translators]
      ,[Type]
      ,[Publisher]
      ,[Pub Date]
      ,[No.]
      ,[Vol.]
      ,[Edition]
      ,[genre]
      ,[Book Signed]
      ,[Message]
      ,[Condition]
      ,[Condition Notes]
      ,[Duplicate Copies]
      ,[Duplicate Detail]
      ,[Annotations]
      ,[Type of Annotation]
      ,[Keywords]
      ,[ISBN]
      ,[Cover_Image]
      ,[Notes]
      ,[Call Number]
      ,[imageFileName]
      ,[shelved]
      ,[updated]
      ,[needToFind]
      ,[internalNotes]
      ,[last_edit_date]
      ,[last_edit_by]
      ,[tempISBN]
      ,[tempCallNumber]
      ,[language]
      ,[detailNotes]
      ,[processed]
      ,[coverImage]
  FROM [Cage].[dbo].[tbl_CageLibrary]	
  order by row
	</cfquery>
	<cfreturn searchTitles>
</cffunction>



<cffunction name="getTitles" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="titles">
		SELECT DISTINCT [Book Title] AS label
		FROM         tbl_CageLibrary
		ORDER BY label
	</cfquery>
	<cfreturn titles>
</cffunction>

<cffunction name="getAuthors" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="authors">
		SELECT  distinct   Author
		FROM         tbl_CageLibrary
		WHERE Author IS NOT NULL
		ORDER BY Author
	</cfquery>
	<cfreturn authors>
</cffunction>

<cffunction name="getPublishers" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="publishers">
		SELECT  distinct  Publisher
		FROM         tbl_CageLibrary
		WHERE Author IS NOT NULL
		ORDER BY Publisher
	</cfquery>
	<cfreturn publishers>
</cffunction>

<cffunction name="getEditors" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="editors">
		SELECT  distinct  Editor
		FROM         tbl_CageLibrary
		WHERE Editor IS NOT NULL
		ORDER BY Editor
	</cfquery>
	<cfreturn editors>
</cffunction>

<cffunction name="getKeywords" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="keywords">
		SELECT     id AS data, keyword AS label
		FROM         tbl_LibraryKeywords
		ORDER BY keyword
	</cfquery>
	<cfreturn keywords>
</cffunction>

<cffunction name="getTranslators" access="remote" returntype="Any" >
	<cfquery datasource="cageWebUSer" name="translators">
		SELECT DISTINCT Translators
		FROM         tbl_CageLibrary
		WHERE Translators IS NOT NULL
		ORDER BY Translators
	</cfquery>
	<cfreturn translators>
</cffunction>


</cfcomponent>