<cfcomponent>
<cffunction name="init" access="remote" returntype="cage">
  <cfreturn this />
</cffunction>


<cffunction name="getPianoWorks" access="remote" returntype="any" output="no">
  <cfquery name="pianoWorks" datasource="cage">
        SELECT     Works_Table.Work_Title, Works_Table.Work_ID, Works_Table.Work_Alt_Title, Instrument_Specific_Table.Instrument, Instrument_Specific_Table.Inst_Spec_ID, 
                              Works_Table.Work_Date_String, Works_Table.Work_Length_String, Works_Table.Work_General_Comments
        FROM         Works_Table INNER JOIN
                              Instrument_Specific_Table ON Works_Table.Specific_Ins = Instrument_Specific_Table.Inst_Spec_ID
        WHERE     (Instrument_Specific_Table.Inst_Spec_ID = 25)
        order by  Works_Table.Work_Title
        </cfquery>
  <cfreturn pianoWorks>
</cffunction>


<cffunction name="getManuscriptLocations" output="false" access="remote" returntype="query">
  <cfset var manuscriptLocations = "" >
  <cfquery name="manuscriptLocations" datasource="cage">
SELECT Location_ID as data, Location as label
FROM dbo.Man_Location_Table
ORDER BY Location ASC 
    </cfquery>
  <cfreturn manuscriptLocations>
</cffunction>

<cffunction name="getEnsembleTypes" output="false" access="remote" returntype="query">
  <cfset var ensembleTypes = "" >
  <cfquery name="ensembleTypes" datasource="cage">
SELECT     Ensemble_Type_ID as data, Ensemble_Type as label
FROM         Ensemble_Type_Table
ORDER BY Ensemble_Type
    </cfquery>
  <cfreturn ensembleTypes>
</cffunction>

<cffunction name="getInstrumentTypes" output="false" access="remote" returntype="query">
  <cfset var instrumentTypes = "" >
  <cfquery name="instrumentTypes" datasource="cage">
SELECT     Instrument_Type_ID AS data, Instrument_Type AS label
FROM         Instrument_Type_Table
ORDER BY label
    </cfquery>
  <cfreturn instrumentTypes>
</cffunction>

<cffunction name="getSpecificInstruments" output="false" access="remote" returntype="query">
  <cfset var specificInstruments = "" >
  <cfquery name="specificInstruments" datasource="cage">
SELECT     Inst_Spec_ID AS data, Instrument AS label
FROM         Instrument_Specific_Table
ORDER BY label
    </cfquery>
  <cfreturn specificInstruments>
</cffunction>

<cffunction name="getCollaborators" output="no" access="remote" returntype="query">
	<cfquery name="collaborators" datasource="cage">
    	SELECT     Collab_ID AS data, sortName AS label
        FROM         Collab_Table
        ORDER BY label
    </cfquery>
    <cfreturn collaborators>
</cffunction>

<cffunction name="getWorkDetails" output="no" access="remote" returntype="query">
<cfargument name="work_ID" type="numeric" required="yes">
<cfquery name="workDetails" datasource="cage">
SELECT     Works_Table.Work_ID, Works_Table.Work_Title, Works_Table.Work_Alt_Title, Works_Table.Work_Alt_Title_2, Works_Table.Work_Date_String, 
                      Works_Table.Work_Source_Peters, Arranger_Table.Arranger_Name, Works_Table.Work_Ins_text_string, Works_Table.Work_Length_String, 
                      Works_Table.Work_Editor, Works_Table.Work_General_Comments, Ensemble_Type_Table.Ensemble_Type, Works_Table.[Dedicatee(s)] AS Dedicated, 
                      Works_Table.petersLink
FROM         Ensemble_Type_Table RIGHT OUTER JOIN
                      Works_Table LEFT OUTER JOIN
                      Editor_Table ON Works_Table.Work_Editor = Editor_Table.Editor_ID ON 
                      Ensemble_Type_Table.Ensemble_Type_ID = Works_Table.Ensemble_Type_LU LEFT OUTER JOIN
                      Arranger_Table ON Works_Table.Work_Arranger = Arranger_Table.Arranger_ID
WHERE     (Works_Table.Work_ID = #work_ID#)
</cfquery>
<cfreturn workDetails>
</cffunction>


<cffunction name="getRecordSummary" output="no" access="remote" returntype="query">
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

<cffunction name="getManuscriptLocationsForWork" output="no" access="remote" returntype="query">
<cfargument name="work_ID" type="numeric" required="yes">
<cfquery name="manuscripts" datasource="cage">
SELECT     Man_Location_Table.Location, viewManuscriptLocation.work_ID
FROM         viewManuscriptLocation INNER JOIN
                      Man_Location_Table ON viewManuscriptLocation.Manuscript_Location = Man_Location_Table.Location_ID
WHERE     (viewManuscriptLocation.work_ID = #work_ID#)
</cfquery>
<cfreturn manuscripts>
</cffunction>


</cfcomponent>