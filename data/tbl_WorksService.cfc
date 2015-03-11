<cfcomponent output="false">

	<cffunction name="updateRecording" access="remote" returntype="Any">
	    <cfargument name="recording" required="true" type="any">
	    <cfquery name="updateRecording" datasource="king">
	        UPDATE dbo.tbl_Recordings
        SET label = #recording.label# ,
          link = '#recording.link#',
          soundfile = '#recording.soundfile#' ,
          recording_notes = '#recording.recording_notes#' ,
          Year_Released = #recording.Year_Released# ,
          yearReleasedString = '#recording.yearReleasedString#' ,
          Musicians = '#recording.Musicians#' ,
          image = '#recording.image#',
          recordingTitle = '#recording.recordingTitle#'
	       from tbl_Recordings
	       where id = #recording.id# 
	       select 1
	    </cfquery>
    <cfreturn 	updateRecording>     
	</cffunction>
    
    
    <cffunction name="getRecordingDetails" access="remote" returntype="Any">
        <cfargument name="recordingID" required="true" type="numeric">
        <cfquery name="recordingDetails" datasource="king">
            select * from tbl_Recordings
            where id = #recordingID#
        </cfquery>
        <cfreturn recordingDetails>
    </cffunction>
    
    
    <cffunction name="getRecording" access="remote" returntype="Any">
        
        <cfquery name="recordings" datasource="king">
            select * from tbl_Recordings
        </cfquery>
        <cfreturn recordings>   
    </cffunction>
    
    <cffunction name="getLabels" access="remote" returntype="Any">
    <cfquery name="labels" datasource="king">
        select id as data, label
        from tbl_Labels
    </cfquery>
    <cfreturn labels>
    </cffunction>
    
    <cffunction name="getImagesForWork" access="remote" returntype="any">
      <cfargument name="workID" type="numeric" required="yes">
      <cfquery name="imagesForWork" datasource="king">
      SELECT     tbl_Work_Images.imageID, tbl_Images.imageFileName, tbl_ImageType.imageType, tbl_Images.imageLabel
        FROM         tbl_Work_Images INNER JOIN
                              tbl_Images ON tbl_Work_Images.imageID = tbl_Images.id INNER JOIN
                              tbl_ImageType ON tbl_Images.imageType = tbl_ImageType.id
        WHERE     (tbl_Work_Images.workID = #workID#)
      </cfquery>
    <cfreturn imagesForWork>
    </cffunction>
    
    <cffunction name="getImageTypes" access="remote" returntype="any">
    <cfquery name="getImageTypes" datasource="king">
   SELECT id AS data,imageType AS label FROM dbo.tbl_ImageType
    </cfquery>
    <cfreturn getImageTypes>
    </cffunction>
    
    <cffunction name="getDataForImage" access="remote" returntype="any">
    <cfargument name="imageID" type="numeric" required="yes">
    <cfquery name="dataForImage" datasource="king">
    SELECT     id, imageFileName, imageType, imageLabel
FROM         tbl_Images
WHERE     (id = #imageID#)
    
    </cfquery>
    <cfreturn dataForImage>
    </cffunction>
    
    
     <cffunction name="updateImageRecord" access="remote" returntype="any">
     <cfargument name="imageData" type="any" required="yes">
     <cfquery name="updateImage" datasource="king">
     	UPDATE dbo.tbl_Images
        SET imageFileName = '#imageData.imageFileName#',
        imageType = #imageData.imageType#,
        imageLabel = '#imageData.imageLabel#'
        WHERE id = #imageData.id#
        select 1
     </cfquery>
     <cfreturn updateImage>
     </cffunction>
     
     <cffunction name="insertImageRecord" access="remote" returntype="any">
     <cfargument name="imageData" type="any" required="yes">
     <cfquery name="insertImage" datasource="king">
		INSERT INTO dbo.tbl_Images
        ( imageFileName ,
          imageType ,
          imageLabel
        )
		VALUES  ( '#imageData.imageFileName#' , -- imageFileName - nvarchar(500)
          #imageData.imageType# , -- imageType - int
          '#imageData.imageLabel#' -- imageLabel - nvarchar(500)
        )
        select newImageID = @@IDENTITY
     </cfquery>
     <cfreturn insertImage>
     </cffunction>
    
      
     
    
	<cffunction name="getCategories" output="false" access="remote" returntype="any">
    <cfquery name="categories" datasource="king">
    	SELECT * FROM dbo.tbl_Categories
		ORDER BY Category
    </cfquery>
    	<cfreturn categories>
    </cffunction>
    
    <cffunction name="deleteImageWorkRecord" output="false" access="remote" returntype="any">
    <cfargument name="workID" type="any" required="yes">
       <cfargument name="imageID" type="any" required="yes">
    <cfquery name="categories" datasource="king">
    		DELETE FROM dbo.tbl_Work_Images
         WHERE imageID = #imageID# AND workID = #workID#    
    </cfquery>
    <cfquery name="deleteImage" datasource="king">
    delete from tbl_Images where id = #imageID#
    select 1
    </cfquery>
    	<cfreturn deleteImage>
    </cffunction>


	 <cffunction name="insertImageWorkRecord" access="remote" returntype="any">
      <cfargument name="workID" type="any" required="yes">
       <cfargument name="imageID" type="any" required="yes">
      <cfquery name="imageWork" datasource="king">
      	INSERT INTO dbo.tbl_Work_Images
        ( workID, imageID )
			VALUES  
            ( #workID#, -- workID - int
          #imageID# -- imageID - int
          )
           select newImageID = @@IDENTITY
      </cfquery>
       <cfreturn imageWork>     
      </cffunction>
      

	<cffunction name="insertCategory" output="no" access="remote" returntype="any">
    <cfargument name="workID" type="numeric" required="yes">
     <cfargument name="catID" type="numeric" required="yes">
     <cfquery name="insertCategory" datasource="king">
     	INSERT INTO dbo.tbl_Work_Categories
        ( work, category )
		VALUES  ( #workID#, -- work - int
          			#catID#  -- category - int
          )
          select 1
     </cfquery>
     <cfreturn insertCategory>
    </cffunction>


	<cffunction name="getCategoriesForWork" access="remote" returntype="any">
    	 <cfargument name="workID" type="numeric" required="yes">
    	<cfquery name="catsForWork" datasource="king">

SELECT     tbl_Work_Categories.[work], tbl_Work_Categories.category, tbl_Categories.Category AS CatLabel
FROM         tbl_Work_Categories INNER JOIN
                      tbl_Categories ON tbl_Work_Categories.category = tbl_Categories.id
WHERE work = #workID#
        </cfquery>
      <cfreturn catsForWork>  
    </cffunction>

	<cffunction name="deleteCatFromWork" access="remote" returntype="any">
    <cfargument name="workID" type="numeric" required="yes">
     <cfargument name="catID" type="numeric" required="yes">
     <cfquery name="deleteCat" datasource="king">
       DELETE FROM dbo.tbl_Work_Categories
 		 WHERE category = #catID# AND work = #workID#
         select 1
     </cfquery>
     <cfreturn deleteCat>
    </cffunction>


	<cffunction name="getAlltbl_Works" output="false" access="remote" returntype="any" >

		<!--- Auto-generated method
		        Retrieve set of records and return them as a query or array.
		        Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		
		<cfset var qAllItems="">
		<cfquery name="qAllItems" datasource="king">
			SELECT * FROM tbl_Works
		</cfquery>
		<cfreturn qAllItems>
		
	</cffunction>
            
	<cffunction name="gettbl_Works" output="false" access="remote"  returntype="any" >
		<cfargument name="id" type = "numeric" required="true" />

		<!--- TODO Auto-generated method
		        Retrieve a single record and return it as a query or array.
		        Add authorization or any logical checks for secure access to your data --->
		 
		<!--- Sample Code ---> 
		
		<cfset var qItem="">
		<cfquery name="qItem" datasource="king">
			SELECT * 
			FROM tbl_Works 
			WHERE id = <CFQUERYPARAM CFSQLTYPE="CF_SQL_INTEGER" VALUE="#ARGUMENTS.id#">
		</cfquery>

		<cfreturn qItem>
		 
	</cffunction>

	<cffunction name="createtbl_Works" output="false" access="remote" returntype="any" >
		<cfargument name="item" required="true" />

		<!--- TODO Auto-generated method
		        Insert a new record in the database.
				Add authorization or any logical checks for secure access to your data --->
		 
		<!--- Sample Code --->

		<cfquery name="createItem" datasource="king" result="result">
			INSERT INTO tbl_Works (title, Year, yearString, timing, timingString, premiere, Work_Performance_Comments, scoreFilename, instrumentationString)
            		VALUES (<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.title#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_DATE" VALUE="#item.Year#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.yearString#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_INTEGER" VALUE="#item.timing#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.timingString#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.premiere#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_LONGVARCHAR" VALUE="#item.Work_Performance_Comments#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.scoreFilename#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.instrumentationString#">)
                                
                select @@identity                
		</cfquery>
		
		<!--- The GENERATED_KEY is valid for mysql database only, you can modify it for your database --->
		<cfreturn result>
		
	</cffunction>
                                
     <cffunction name="createtbl_Works2" output="false" access="remote" returntype="any" >
		<cfargument name="item" required="true" />

		<!--- TODO Auto-generated method
		        Insert a new record in the database.
				Add authorization or any logical checks for secure access to your data --->
		 
		<!--- Sample Code --->

		<cfquery name="createItem" datasource="king" result="result" >
			INSERT INTO tbl_Works (title, Year, yearString, timing, timingString, premiere, Work_Performance_Comments, scoreFilename, instrumentationString)
            		VALUES (<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.title#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_DATE" VALUE="#item.Year#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.yearString#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_INTEGER" VALUE="#item.timing#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.timingString#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.premiere#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_LONGVARCHAR" VALUE="#item.Work_Performance_Comments#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.scoreFilename#">, 
							<CFQUERYPARAM cfsqltype="CF_SQL_VARCHAR" VALUE="#item.instrumentationString#">)
                                
                select newID = @@IDENTITY              
		</cfquery>
		
		<cfreturn createItem>
		
	</cffunction>                           

	<cffunction name="updatetbl_Works" output="false" access="remote" returntype="void" >
		<cfargument name="item" required="true" />

		<!--- TODO Auto-generated method
		        Update an existing record in the database.
				Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		 <cfquery name="updateItem" datasource="king">
			UPDATE tbl_Works SET title = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.title#">, 
							 Year = <CFQUERYPARAM cfsqltype=CF_SQL_DATE VALUE="#item.Year#">, 
							 yearString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.yearString#">, 
							 timing = <CFQUERYPARAM cfsqltype=CF_SQL_INTEGER VALUE="#item.timing#">, 
							 timingString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.timingString#">, 
							 premiere = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.premiere#">, 
							 Work_Performance_Comments = <CFQUERYPARAM cfsqltype=CF_SQL_LONGVARCHAR VALUE="#item.Work_Performance_Comments#">, 
							 scoreFilename = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.scoreFilename#">, 
							 instrumentationString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.instrumentationString#">

			WHERE id = <CFQUERYPARAM CFSQLTYPE="CF_SQL_INTEGER" VALUE="#item.id#">
		</cfquery>
				
	</cffunction>
             
    <cffunction name="updatetbl_Works2" output="false" access="remote" returntype="any" >
		<cfargument name="item" required="true" />

		<!--- TODO Auto-generated method
		        Update an existing record in the database.
				Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		 <cfquery name="updateItem" datasource="king">
			UPDATE tbl_Works SET title = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.title#">, 
							 Year = <CFQUERYPARAM cfsqltype=CF_SQL_DATE VALUE="#item.Year#">, 
							 yearString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.yearString#">, 
							 timing = <CFQUERYPARAM cfsqltype=CF_SQL_INTEGER VALUE="#item.timing#">, 
							 timingString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.timingString#">, 
							 premiere = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.premiere#">, 
							 Work_Performance_Comments = <CFQUERYPARAM cfsqltype=CF_SQL_LONGVARCHAR VALUE="#item.Work_Performance_Comments#">, 
							 scoreFilename = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.scoreFilename#">, 
							 instrumentationString = <CFQUERYPARAM cfsqltype=CF_SQL_VARCHAR VALUE="#item.instrumentationString#">

			WHERE id = <CFQUERYPARAM CFSQLTYPE="CF_SQL_INTEGER" VALUE="#item.id#">
             
             select 1
		</cfquery>
    <cfreturn updateItem>
	</cffunction>
         

	<cffunction name="deletetbl_Works" output="false" access="remote" returntype="void" >
		<cfargument name="id" type="numeric" required="true" />

		<!--- TODO Auto-generated method
		        Delete a record in the database.
				Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		<cfquery name="delete" datasource="king">
			DELETE FROM tbl_Works
			WHERE id = <CFQUERYPARAM CFSQLTYPE="CF_SQL_INTEGER" VALUE="#ARGUMENTS.id#">
		</cfquery>
              
	</cffunction>

	<cffunction name="count" output="false" access="remote" returntype="numeric" >

		<!--- TODO Auto-generated method
		        Return the number of items in your table.
				Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		<cfquery name="qread" datasource="king">
			SELECT COUNT(id) AS itemCount FROM tbl_Works
		</cfquery>
        
		<cfreturn qread.itemCount>
		
	</cffunction>
	
	<cffunction name="gettbl_Works_paged" output="false" access="remote" returntype="any" >
		<cfargument name="startIndex" type="numeric" required="true" />
		<cfargument name="numItems" type="numeric" required="true" />


		<!--- TODO Auto-generated method
		        Return a page of numRows number of records as an array or query from the database for this startRow.
				Add authorization or any logical checks for secure access to your data --->
		
		<!--- Sample Code --->
		<!--- The LIMIT keyword is valid for mysql database only, you can modify it for your database --->
		
		<cfset var qRead="">
		<cfquery name="qRead" datasource="king">
			SELECT * FROM tbl_Works LIMIT #startIndex#, #numItems#
		</cfquery>
		<cfreturn qRead>
		
	</cffunction>

</cfcomponent>