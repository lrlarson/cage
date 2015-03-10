<cfcomponent>
	
    <cffunction name="init" access="public" returntype="cageAJAX">
	<cfreturn this />	
	</cffunction>
    
    
  <!--- 4'33" code --->

<cffunction name="getUploadedRecordings" access="remote" returnFormat="json">
<cfquery name="recordings" datasource="cage">
SELECT  [id]
      ,CONVERT(VARCHAR(20), dateTimeCreated, 100)AS dateTimeCreated
      ,[lat]
      ,[long]
      ,[recordist]
      ,[title]
      ,[recordingUUID]
      ,[geoHash]
      ,[inExact]
  FROM [Cage].[dbo].[tbl_4-33Data]
  </cfquery>
<cfreturn recordings>
</cffunction>

<cffunction name="getUploadedRecordings2" access="remote" returnFormat="json">
<cfcontent type="application/json">
<cfquery name="recordings" datasource="cage">
SELECT  [id]
      ,CONVERT(VARCHAR(20), dateTimeCreated, 100)AS dateTimeCreated
      ,[lat]
      ,[long]
      ,[recordist]
      ,[title]
      ,[recordingUUID]
      ,[geoHash]
      ,[inExact]
  FROM [Cage].[dbo].[tbl_4-33Data]

</cfquery>
 <cfset arrGirls = QueryToStruct( recordings ) />
 <cfset objectWrapper = structNew()>
   <cfset objectWrapper.recordings = #arrGirls#>
<cfreturn objectWrapper>
</cffunction>

  
 <!---- Current Production ----> 
<cffunction name="getUploadedRecordings3" access="remote" returnFormat="json">
<cfargument type="string" name="date" required="false" default="12252013">
<cfargument type="numeric" name="maxPoints" required="false" default="-1">
<cfargument type="string" name="hashes" required="true">


<cfscript>
hashList = hashes.split("_");
numberOfHashes = ArrayLen(hashList);
hashLength = len(hashList[1]);
</cfscript>
<cfset instring = "">
<cfloop from="1" to="#numberOfHashes#" index="i">

<cfif numberOfHashes EQ 1>
    
<cfset inString = inString & "#hashList[i]#">    

<cfelse>
<cfif i EQ 1>
<cfset inString = inString & "#hashList[i]#',">  
<cfelseif i LT numberOfHashes>
<cfset inString = inString & "'#hashList[i]#',">  
<cfelse>
<cfset inString = inString & "'#hashList[i]#">  
</cfif>
</cfif>         
</cfloop>
<cfcontent type="application/json">


<cfquery name="recordings" datasource="cage" result="sql">
SELECT  
      <cfif #maxPoints# NEQ -1>
      <cfset maxPoints = maxPoints >
      top #maxPoints#
      </cfif>
      [id]
      ,CONVERT(VARCHAR(20), dateTimeCreated, 100)AS dateTimeCreated
      ,[lat]
      ,[long]
      ,[recordist]
      ,[title]
      ,[recordingUUID]
      ,[geoHash]
      ,[inExact]
      ,dateTimeCreated as dateSort
  FROM [Cage].[dbo].[tbl_4-33Data]
  where LEFT([geoHash],#hashLength#) IN ('#preserveSingleQuotes(inString)#')
  order by dateSort DESC
  
</cfquery>
 <cfset arrGirls = QueryToStruct( recordings ) />
 <cfset objectWrapper = structNew()>
   <cfset objectWrapper.recordings = #arrGirls#>
<cfreturn objectWrapper>

</cffunction>  
 
 <cffunction name="getUploadedRecordings4" access="remote" returnFormat="json">
<cfargument type="string" name="date" required="false" default="12252013">
<cfargument type="numeric" name="maxPoints" required="false" default="-1">
<cfargument type="string" name="hashes" required="true">
<cfscript>
hashList = hashes.split("_");
numberOfHashes = ArrayLen(hashList);
hashLength = len(hashList[1]);
</cfscript>
<cfset instring = "">
<cfloop from="1" to="#numberOfHashes#" index="i">

<cfif i EQ 1>
<cfset inString = inString & "#hashList[i]#',">  
<cfelseif i LT numberOfHashes>
<cfset inString = inString & "'#hashList[i]#',">  
<cfelse>
<cfset inString = inString & "'#hashList[i]#">  
</cfif>         
</cfloop>
<cfcontent type="application/json">

<!---
<cfquery name="recordings" datasource="cage">
SELECT  [id]
      ,CONVERT(VARCHAR(20), dateTimeCreated, 100)AS dateTimeCreated
      ,[lat]
      ,[long]
      ,[recordist]
      ,[title]
      ,[recordingUUID]
      ,[geoHash]
      ,[inExact]
  FROM [Cage].[dbo].[tbl_4-33Data]
  where LEFT([geoHash],#hashLength#) IN ('#inString#')
</cfquery>
 <cfset arrGirls = QueryToStruct( recordings ) />
 <cfset objectWrapper = structNew()>
   <cfset objectWrapper.recordings = #arrGirls#>
<cfreturn objectWrapper>
--->
<cfset returnString = " where LEFT([geoHash],#hashLength#) IN ('#inString#')">
<cfreturn hashList[1]>
</cffunction>  
 
 
  
   
    
     
       
  <cffunction name="recordingUpload" access="remote" returntype="any">
  <cfargument name="dateTimeCreated" type="date" required="yes">
  <cfargument name="lat" type="string" required="yes">
  <cfargument name="long" type="string" required="yes">
  <cfargument name="recordist" type="string" required="yes">
  <cfargument name="title" type="string" required="yes">
  <cfargument name="recordingUUID" type="string" required="yes">
   
<cfif IsNumeric(title)>
<cfset title = title & '_'>      
</cfif> 
    
    <cfif IsNumeric(recordist)>
<cfset recordist = recordist & '_'>      
</cfif> 
      
   
   <cfquery datasource="cage" name="checkExistingRecord">
   SELECT [id],[recordingUUID]
  FROM [Cage].[dbo].[tbl_4-33Data]
  WHERE [recordingUUID] = '#recordingUUID#'
   </cfquery>
   
   <cfif checkExistingRecord.recordCount GT 0>
     <cfquery datasource="cage" name="updateRecording">
                  UPDATE dbo.[tbl_4-33Data]
                SET dateTimeCreated = '#dateTimeRecorded#',
                lat = '#lat#',
                long = '#long#',
                recordist = '#recordist#',
                title = '#title#'
                WHERE recordingUUID = '#recordingUUID#'
           </cfquery>
           
           <cfreturn checkExistingRecord>
   
   
   <cfelse>
   
  
  <cfquery name="insertRecording" datasource="cage" >
  INSERT INTO dbo.[tbl_4-33Data]
        ( dateTimeCreated ,
          lat ,
          long ,
          recordist ,
          title ,
          recordingUUID
        )
VALUES  ( '#dateTimeCreated#' , -- dateTimeCreated - datetime
         '#lat#' , -- lat - nvarchar(100)
          '#long#' , -- long - nvarchar(100)
          '#recordist#' , -- recordist - nvarchar(100)
          '#title#' , -- title - nvarchar(100)
          '#recordingUUID#'  -- recordingUUID - nvarchar(100)
        )
   SELECT @@IDENTITY AS newID
  
  </cfquery>
  <cfreturn insertRecording>
  
  </cfif>
  </cffunction>
    
    
    
    <cffunction name="getWorkDetails" access="remote" returntype="any" output="no">
    <cfargument name="work" required="yes" type="numeric">
    	<cfquery name="workDetails" datasource="cage">
        SELECT     Works_Table.Work_Title, Works_Table.Work_ID, Works_Table.Work_Alt_Title, Instrument_Specific_Table.Instrument, Instrument_Specific_Table.Inst_Spec_ID, 
                              Works_Table.Work_Date_String, Works_Table.Work_Length_String, Works_Table.Work_General_Comments
        FROM         Works_Table INNER JOIN
                              Instrument_Specific_Table ON Works_Table.Specific_Ins = Instrument_Specific_Table.Inst_Spec_ID
        WHERE     (Instrument_Specific_Table.Inst_Spec_ID = 25) AND Works_Table.Work_ID = #work#
        </cfquery>

    <cfreturn workDetails>
    </cffunction>

<cffunction name="getRecordDetails" access="remote" returntype="any" output="no">
<cfargument name="record_ID" required="yes" type="numeric">
<cfquery name="recordDetails" datasource="cage">
SELECT     Record_Table.Record_ID, Record_Table.Record_Title, Medium_Table.Medium, Label_Table.Label, Record_Table.Recording_Number, Record_Table.Year_Released, 
                      Record_Table.Cover_Thumb_Filename, Record_Table.Record_Performers, Record_Table.soundSampleFile, Record_Table.hasSoundSample, 
                      Record_Table.Record_Comment
FROM         Record_Table INNER JOIN
                      Medium_Table ON Record_Table.Medium = Medium_Table.Medium_ID INNER JOIN
                      Label_Table ON Record_Table.Label = Label_Table.Label_ID
                      WHERE Record_ID = #record_ID#
</cfquery>
<cfreturn recordDetails>
</cffunction>





<!--- for 3 column --->   
<cffunction name="getWorkDetails_3" output="no" access="remote" returntype="any" > 
<cfargument name="work_ID" type="numeric" required="yes">
<cfquery name="workDetails_3" datasource="cage">
SELECT     Works_Table.Work_ID, Works_Table.Work_Title, Works_Table.Work_Alt_Title, Works_Table.Work_Alt_Title_2, Works_Table.Work_Date_String, 
                      Works_Table.Work_Source_Peters, Arranger_Table.Arranger_Name, Works_Table.Work_Ins_text_string, Works_Table.Work_Length_String, 
                      Works_Table.Work_Editor, Works_Table.Work_General_Comments, Ensemble_Type_Table.Ensemble_Type, Works_Table.[Dedicatee(s)] as Dedicated
FROM         Ensemble_Type_Table RIGHT OUTER JOIN
                      Works_Table LEFT OUTER JOIN
                      Editor_Table ON Works_Table.Work_Editor = Editor_Table.Editor_ID ON 
                      Ensemble_Type_Table.Ensemble_Type_ID = Works_Table.Ensemble_Type_LU LEFT OUTER JOIN
                      Arranger_Table ON Works_Table.Work_Arranger = Arranger_Table.Arranger_ID
where work_ID = #work_ID#  
</cfquery>
<cfreturn workDetails_3>
</cffunction>
 
<cffunction name="getRecordSummary" output="no" access="remote" returntype="any" >
<cfargument name="work_ID" type="numeric" required="yes">
<cfquery name="recordSummary" datasource="cage">
SELECT DISTINCT Record_Table.Record_ID, Record_Table.Record_Title, Record_Table.Year_Released, Record_Table.Cover_Thumb_Filename
FROM         Record_Table INNER JOIN
                      Track_Table ON Record_Table.Record_ID = Track_Table.Record_ID LEFT OUTER JOIN
                      Medium_Table ON Record_Table.Medium = Medium_Table.Medium_ID
WHERE     (Track_Table.Work_Title = #work_ID#) OR
                      (Track_Table.Work_Title_2 = #work_ID#) OR
                      (Track_Table.Work_Title_3 = #work_ID#) OR
                      (Track_Table.Work_Title_4 = #work_ID#) OR
                      (Track_Table.Work_Title_5 = #work_ID#)
ORDER BY  Record_Table.Year_Released DESC
</cfquery>
<cfreturn recordSummary>
</cffunction>

 <cffunction name="getRecordings" access="remote" returntype="any" output="no">
  <cfargument name="work" required="yes" type="numeric">
 <cfquery name="recordings" datasource="cage">
SELECT DISTINCT 
                      Works_Table.Work_Title, Record_Table.Record_Title, Record_Table.Recording_Number, Record_Table.Cover_Thumb_Filename, Label_Table.Label, 
                      Label_Table.Country, Medium_Table.Medium, Record_Table.Record_Performers, dbo.Works_Table.Work_ID
FROM         Record_Table INNER JOIN
                      Track_Table ON Record_Table.Record_ID = Track_Table.Record_ID INNER JOIN
                      Works_Table ON Track_Table.Work_Title = Works_Table.Work_ID INNER JOIN
                      Label_Table ON Record_Table.Label = Label_Table.Label_ID INNER JOIN
                      Medium_Table ON Record_Table.Medium = Medium_Table.Medium_ID
WHERE     dbo.Works_Table.Work_ID = #work#
</cfquery>
 <cfreturn recordings>
 </cffunction> 
 
 <cffunction name="getManuscriptLocationsForWork" output="no" access="remote" returntype="any" >
<cfargument name="work_ID" type="numeric" required="yes">
<cfquery name="manuscripts" datasource="cage">
SELECT     Man_Location_Table.Location, viewManuscriptLocation.work_ID
FROM         viewManuscriptLocation INNER JOIN
                      Man_Location_Table ON viewManuscriptLocation.Manuscript_Location = Man_Location_Table.Location_ID
WHERE     (viewManuscriptLocation.work_ID = #work_ID#)
</cfquery>
<cfreturn manuscripts>
</cffunction>
 
 
 <cffunction name="getWorks" access="remote" returntype="any" output="no">
 <cfargument name="length" type="numeric" required="yes">
  <cfargument name="premiereYear" type="numeric" required="yes">
   <cfargument name="manuscriptLocation" type="numeric" required="yes">
     <cfargument name="ensembleType" type="numeric" required="yes">
     <cfargument name="instrumentType" type="numeric" required="yes">
      <cfargument name="specificInstrument" type="numeric" required="yes">
     <cfargument name="stringSearch" type="string" required="yes">	
     <cfargument name="collaborator" type="numeric" required="yes">
     <cfargument name="recordings" type="numeric" required="yes">
     <cfargument name="published" type="numeric" required="yes">
     <cfargument name="number" type="numeric" required="no" default="0">
     <cfargument name="numberLimit" type="numeric" required="no" default="1">
     <cfargument name="cunningham" type="numeric" required="no" default="0">
     <cfargument name="dateDisplay" type="numeric" required="no" default="0">
 <cfquery name="filteredWorks" datasource="cage" >
  SELECT     Works_Table.Work_ID, Works_Table.Work_Title, Works_Table.Work_Year_Premiered, Works_Table.Work_Date_String, Works_Table.Work_Length_String, 
                      Works_Table.Work_General_Comments, Ensemble_Type_Table.Ensemble_Type, Works_Table.doNotShow, Works_Table.Work_Ins_text_string, 
                      Instrument_Type_Table.Instrument_Type, Instrument_Specific_Table.Instrument, Works_Table.Work_Alt_Title, Works_Table.Work_Length
FROM         Man_Location_Table AS Man_Location_Table_1 RIGHT OUTER JOIN
                      Collab_Table RIGHT OUTER JOIN
                      Collab_Table AS Collab_Table_2 RIGHT OUTER JOIN
                      Works_Table LEFT OUTER JOIN
                      Instrument_Specific_Table ON Works_Table.Specific_Ins = Instrument_Specific_Table.Inst_Spec_ID LEFT OUTER JOIN
                      Instrument_Type_Table ON Works_Table.Work_Ins_Type1 = Instrument_Type_Table.Instrument_Type_ID ON 
                      Collab_Table_2.Collab_ID = Works_Table.Work_Collab2 LEFT OUTER JOIN
                      Collab_Table AS Collab_Table_1 ON Works_Table.Work_Collab3 = Collab_Table_1.Collab_ID ON 
                      Collab_Table.Collab_ID = Works_Table.Work_Collab1 LEFT OUTER JOIN
                      Man_Location_Table ON Works_Table.Manuscript_Location = Man_Location_Table.Location_ID ON 
                      Man_Location_Table_1.Location_ID = Works_Table.Manuscript_Location_2 LEFT OUTER JOIN
                      Ensemble_Type_Table ON Works_Table.Ensemble_Type_LU = Ensemble_Type_Table.Ensemble_Type_ID LEFT OUTER JOIN
                      Man_Location_Table AS Man_Location_Table_2 ON Works_Table.Manuscript_Location_3 = Man_Location_Table_2.Location_ID

 

 
 where
 
 Work_ID <> 336
 
 <cfif #length# GT 0 >
   <cfswitch expression="#length#">
                       <cfcase value="1">
                       and Work_Length< 10
                       </cfcase>
                      	 <cfcase value="2">
                       and Work_Length between 10 and 19
                       </cfcase>
                       <cfcase value="3">
                       and Work_Length between 20 and 29
                       </cfcase>
                       <cfcase value="4">
                       and Work_Length> 29
                       </cfcase>
    </cfswitch>	
 </cfif>
 
 <cfif #premiereYear# GT 0>
 	<cfswitch expression="#premiereYear#">
 		 				<cfcase value="1">
                       and Work_Year_Premiered < 1940
                       </cfcase>
                      	 <cfcase value="2">
                       and Work_Year_Premiered between 1940 and 1949
                       </cfcase>
                       <cfcase value="3">
                       and Work_Year_Premiered between 1950 and 1959
                       </cfcase>
                       <cfcase value="4">
                       and Work_Year_Premiered between 1960 and 1969
                       </cfcase>
                        <cfcase value="5">
                       and Work_Year_Premiered between 1970 and 1979
                       </cfcase>
                       <cfcase value="6">
                       and Work_Year_Premiered between 1980 and 1989
                       </cfcase>
                       <cfcase value="7">
                       and Work_Year_Premiered > 1989
                       </cfcase>
 	</cfswitch>
    and Work_Year_Premiered is not null
 </cfif>
 
 <cfif #manuscriptLocation# GT 0>
 
  AND (#manuscriptLocation# IN
                          (SELECT     Manuscript_Location
                            FROM          viewManuscriptLocation
                            WHERE      (work_ID = Works_Table.Work_ID)))
 
 
 </cfif>
 
 <cfif #ensembleType# GT 0>
 	 and  Works_Table.Ensemble_Type_LU = #ensembleType#
</cfif>
 
 
 <!--- instrument type --->
 <cfif #instrumentType# GT 0>
 	and (#instrumentType# IN (SELECT     Work_Ins_Type1
            FROM          viewInstrumentType
            WHERE      (work_ID = Works_Table.Work_ID))) 
 </cfif>
 
 <!--- specific instrument --->
 <cfif #specificInstrument# GT 0>
  						AND (#specificInstrument#  IN
                          (SELECT     Specific_Ins
                            FROM          viewSpecificInstruments
                            WHERE      (work_ID = Works_Table.Work_ID))) 
 </cfif>
 
 
 <!---- String Search --->
 <cfif #stringSearch# NEQ ''>
 				and (Works_Table.Work_ID IN
                (select work_ID from viewWorksTitle where work_title like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="35" value="%#stringSearch#%">))
 
 </cfif>
 
 <!---- collaborator --->
 <cfif #collaborator# GT 0>
						 AND (#collaborator# IN
                          (SELECT     Work_Collab1
                            FROM          viewCollaborators
                            WHERE      (work_ID = Works_Table.Work_ID)))
 </cfif>
 
 
 <!---- recordings --->
 <cfif #recordings# GT 0>
 
 		<cfif #recordings# EQ 1>
  					and (Works_Table.Work_ID IN
                     (select work_title from viewRecordedWorks))
        <cfelseif  #recordings# EQ 2>
        			  	and (Works_Table.Work_ID NOT IN
                     (select work_title from viewRecordedWorks))
        <cfelse>
        
        </cfif>            
 </cfif>
 
 <!--- published --->
 <cfif #published# GT 0>
 		<cfif #published#  EQ 1>
        and published_flag = 1
        <cfelseif #published#  EQ 2>
        and published_flag = 0
        <cfelse>
        
        </cfif>
 </cfif>
 
 <!--- number of players --->
 <cfif #number# GT 0>
 	<cfswitch expression="#numberLimit#">
    	<cfcase value="1">
        	and work_number_players_low = #number# and work_number_players_high = #number#
        
        </cfcase>
        <cfcase value="2">
        and work_number_players_low = 1 and work_number_players_high <= #number#
        </cfcase>
    	<cfcase value="3">
        and work_number_players_low >= #number#
        
        </cfcase>
    </cfswitch>
 
 </cfif>
 
 <!--- cunningham related --->
 
 <cfif #cunningham# GT 0>
and Cage_Cunningham = 1
 </cfif>
 
 <cfif dateDisplay EQ 0>
 order by Work_Title
 <cfelse>
 order by Work_Year_Finished
 </cfif>
 
 </cfquery>
 
 <cfreturn filteredWorks>
 </cffunction>
 
     <cffunction name="QueryToStruct" access="public" returntype="any" output="false"
	hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">

	<!--- Define arguments. --->
	<cfargument name="Query" type="query" required="true" />
	<cfargument name="Row" type="numeric" required="false" default="0" />

	<cfscript>

		// Define the local scope.
		var LOCAL = StructNew();

		// Determine the indexes that we will need to loop over.
		// To do so, check to see if we are working with a given row,
		// or the whole record set.
		if (ARGUMENTS.Row){

			// We are only looping over one row.
			LOCAL.FromIndex = ARGUMENTS.Row;
			LOCAL.ToIndex = ARGUMENTS.Row;

		} else {

			// We are looping over the entire query.
			LOCAL.FromIndex = 1;
			LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;

		}

		// Get the list of columns as an array and the column count.
		LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
		LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );

		// Create an array to keep all the objects.
		LOCAL.DataArray = ArrayNew( 1 );

		// Loop over the rows to create a structure for each row.
		for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){

			// Create a new structure for this row.
			ArrayAppend( LOCAL.DataArray, StructNew() );

			// Get the index of the current data array object.
			LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );

			// Loop over the columns to set the structure values.
			for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){

				// Get the column value.
				LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];

				// Set column value into the structure.
				LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];

			}

		}


		// At this point, we have an array of structure objects that
		// represent the rows in the query over the indexes that we
		// wanted to convert. If we did not want to convert a specific
		// record, return the array. If we wanted to convert a single
		// row, then return the just that STRUCTURE, not the array.
		if (ARGUMENTS.Row){

			// Return the first array item.
			return( LOCAL.DataArray[ 1 ] );

		} else {

			// Return the entire array.
			return( LOCAL.DataArray );

		}

	</cfscript>
</cffunction>
   
</cfcomponent>