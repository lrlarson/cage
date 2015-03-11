<cfcomponent>

<cffunction name="getLinkedWords" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.procLinkedWords" datasource="cage">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
    
 <cffunction name="insertAssetRecord" access="remote" returntype="any" output="false">
  <cfargument name="linkedWord" required="yes" type="numeric" >
  <cfargument name="inProcessMaterials" required="yes" type="string" >
    <cfargument name="currentAction" required="yes" type="string" >
  <CFSTOREDPROC procedure="dbo.procInsertNewAssetRecord" datasource="cage">
    <CFPROCPARAM type="IN" dbvarname="@linkedWord" value="#linkedWord#" cfsqltype="cf_sql_integer">
    <CFPROCPARAM type="IN" dbvarname="@inProcessMaterials" value="#inProcessMaterials#" cfsqltype="cf_sql_varchar">
     <CFPROCPARAM type="IN" dbvarname="@currentAction" value="#currentAction#" cfsqltype="cf_sql_varchar">
      <CFPROCPARAM type="OUT" dbvarname="@newID" variable="newID"  cfsqltype="cf_sql_integer">
  </CFSTOREDPROC>
  <cfreturn newID>
</cffunction>

 <cffunction name="editAssetRecord" access="remote" returntype="any" output="false">
  <cfargument name="inProcessMaterials" required="yes" type="string" >
    <cfargument name="currentAction" required="yes" type="string" >
     <cfargument name="ID" required="yes" type="numeric" >
     
  <CFSTOREDPROC procedure="dbo.[procEditAssetRecord]" datasource="cage">
    <CFPROCPARAM type="IN" dbvarname="@inProcessMaterials" value="#inProcessMaterials#" cfsqltype="cf_sql_varchar">
     <CFPROCPARAM type="IN" dbvarname="@currentAction" value="#currentAction#" cfsqltype="cf_sql_varchar">
      <CFPROCPARAM type="IN" dbvarname="@ID" value="#ID#" cfsqltype="cf_sql_integer">
        <CFPROCPARAM type="OUT" dbvarname="@newID" variable="newID"  cfsqltype="cf_sql_integer">
  </CFSTOREDPROC>
  	<cfmail to="lrlarson@mac.com" from="lrlarson@mindspring.com" subject="there has been a cage edit">
    There has been a cage edit to the item #inProcessMaterials#, ID = #ID#
    </cfmail>
    <cfreturn newID>
</cffunction>

<cffunction name="insertAssetRecordFinal" access="remote" returntype="any" output="false">
<cfargument name="assetFileName" type ="string" required = "yes">
<cfargument name="assetName" type ="string" required = "yes">
<cfargument name="assetType" type ="numeric" required = "yes">
<cfargument name="linkedWord" type ="numeric" required = "yes">
<cfargument name="assetGroup" type ="numeric" required = "yes">
	<cfstoredproc procedure="procCreateAssetRecord" datasource="cage">
    <cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@assetFileName" value="#assetFileName#">
	<cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@assetName" value="#assetName#">
	<cfprocparam cfsqltype="cf_sql_integer" dbvarname="@assetType" value="#assetType#">
    <cfprocparam cfsqltype="cf_sql_integer" dbvarname="@linkedWord" value="#linkedWord#">
    <cfprocparam cfsqltype="cf_sql_integer" dbvarname="@assetGroup" value="#assetGroup#">
     <CFPROCPARAM type="OUT" dbvarname="@newID" variable="newID"  cfsqltype="cf_sql_integer">
    </cfstoredproc>
     <cfreturn newID>
</cffunction>
 
<cffunction name="getAllSubmittedAssets" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.procGetAllSubmittedMaterials" datasource="cage">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
  <cffunction name="addLinkedWord" access="remote" returntype="any">
      <cfargument name="linkedWord" type ="string" required = "yes">
      <cfargument name="primaryWord" type="boolean" required="yes">
      <CFSTOREDPROC procedure="dbo.procAddLinkedWord" datasource="cage">
         <cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@linkedWord" value="#linkedWord#">
         <cfprocparam cfsqltype="cf_sql_bit" dbvarname="@primaryWord" value="#primaryWord#">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
   <cffunction name="updateParagraph" access="remote" returntype="any">
      <cfargument name="newText" type ="string" required = "yes">
      <cfargument name="id" type="numeric" required="yes">
      <CFSTOREDPROC procedure="dbo.procUpdateParagraph" datasource="cage">
         <cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@newText" value="#newText#">
         <cfprocparam cfsqltype="cf_sql_integer" dbvarname="@id" value="#id#">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
   
  <cffunction name="getChildren" access="remote" returntype="query">
   <cfargument name="id" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.[procGetLinkedChildren]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@ID" value="#id#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
  <cffunction name="getPrimaryLinkedWords" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.[procGetPrimaryLinkedWords]" datasource="cage">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
  <cffunction name="getFirstChildren" access="remote" returntype="query">
   <cfargument name="id" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.[procGetLinkedFirstChild]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@ID" value="#id#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
  <cffunction name="deleteAssetRecord" access="remote" returntype="any">
   <cfargument name="id" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.[procDeleteAssetRecord]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@ID" value="#id#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
  
   <cffunction name="getParent" access="remote" returntype="query">
   <cfargument name="id" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.[procGetLinkedParents]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@ID" value="#id#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="linkedWords">
  </CFSTOREDPROC>
  <cfreturn linkedWords>
  </cffunction>  
   
   
   <cffunction name="updateParent" access="remote" returntype="any">
   <cfargument name="currentWordID" required="yes" type="numeric" >
    <cfargument name="newParent" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.[procCreateParentRelationship]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@currentWordID" value="#currentWordID#" cfsqltype="cf_sql_integer">
      <CFPROCPARAM type="IN" dbvarname="@newParent" value="#newParent#" cfsqltype="cf_sql_integer">
  </CFSTOREDPROC>
  </cffunction>  
  
  <cffunction name="getAssetsForLinkedWord" access="remote" returntype="query">
  <cfargument name="linkedWord" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.procGetAvailableFilesForLinkedWord" datasource="cage">
  <CFPROCPARAM type="IN" dbvarname="@linkedWord" value="#linkedWord#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="availableAssets">
  </CFSTOREDPROC>
  <cfreturn availableAssets>
  </cffunction>  
  
  <cffunction name="getAssetsAndChildrenForLinkedWord" access="remote" returntype="any">
  <cfargument name="linkedWord" required="yes" type="numeric" >
  <CFSTOREDPROC procedure="dbo.procGetAvailableFilesForLinkedWord" datasource="cage">
  <CFPROCPARAM type="IN" dbvarname="@linkedWord" value="#linkedWord#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="availableAssets">
  </CFSTOREDPROC>
   <CFSTOREDPROC procedure="dbo.[procGetLinkedFirstChild]" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@ID" value="#linkedWord#" cfsqltype="cf_sql_integer">
   <CFPROCRESULT name="children">
     </CFSTOREDPROC>
	<cfset mystruct=StructNew()>
    <cfset mystruct.availableAssets=#availableAssets#>
    <cfset mystruct.children=#children#>
    <cfreturn mystruct>
    
</cffunction>
  
   <cffunction name="getFileTypes" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.procGetFileTypes" datasource="cage">
    <CFPROCRESULT name="fileTypes">
  </CFSTOREDPROC>
  <cfreturn fileTypes>
  </cffunction>  
  
  <cffunction name="getKeywordsWithAssets" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.procGetAllKeywordsWithAssets" datasource="cage">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>  
  
   <cffunction name="getAutoBioParagraphs" access="remote" returntype="query">
  <CFSTOREDPROC procedure="dbo.procGetAutoBioStatementInOrder" datasource="cage">
    <CFPROCRESULT name="Paragraphs">
  </CFSTOREDPROC>
  <cfreturn Paragraphs>
  </cffunction>  
  
  <cffunction name="getAssetsGroupsForKeyword" access="remote" returntype="query">
  <cfargument name="linkedWord" required="yes" type="numeric" >
  	<CFSTOREDPROC procedure="dbo.procGetAssetGroupsForLinkedWord" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@linkedWord" value="#linkedWord#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>
  
  <cffunction name="getAssetsForAssetGroup" access="remote" returntype="query">
  <cfargument name="assetGroupID" required="yes" type="numeric" >
  	<CFSTOREDPROC procedure="dbo.procGetAssetsForAssetGroup" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@id" value="#assetGroupID#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>
  
  <cffunction name="getAssetsGroupDescriptionForAssetGroup" access="remote" returntype="query">
  <cfargument name="id" required="yes" type="numeric" >
  	<CFSTOREDPROC procedure="dbo.procGetAssetsForAssetGroup" datasource="cage">
  	 <CFPROCPARAM type="IN" dbvarname="@id" value="#id#" cfsqltype="cf_sql_integer">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>
  
  <cffunction name="insertNewAssetGroupName" access="remote" returntype="query">
  <cfargument name="assetGroupName" required="yes" type="string" >
  <cfargument name="linkedWord" required="yes" type="numeric" >
   <cfargument name="assetGroupDescription" required="yes" type="string" >
  	<CFSTOREDPROC procedure="dbo.procAddAssetGroup" datasource="cage">
     <CFPROCPARAM type="IN" dbvarname="@assetGroupName" value="#assetGroupName#" cfsqltype="cf_sql_varchar">
  	 <CFPROCPARAM type="IN" dbvarname="@linkedWord" value="#linkedWord#" cfsqltype="cf_sql_integer">
     <CFPROCPARAM type="IN" dbvarname="@assetGroupDescription" value="#assetGroupDescription#" cfsqltype="cf_sql_varchar">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>
  
  
   <cffunction name="editAssetGroupName" access="remote" returntype="any">
    	<cfargument name="id" required="yes" type="numeric" >
  		<cfargument name="assetGroupDescription" required="yes" type="string" >
  	<CFSTOREDPROC procedure="dbo.procSaveAssetGroupEdit" datasource="cage">
   	 <CFPROCPARAM type="IN" dbvarname="@id" value="#id#" cfsqltype="cf_sql_integer">
     <CFPROCPARAM type="IN" dbvarname="@assetGroupDescription" value="#assetGroupDescription#" cfsqltype="cf_sql_varchar">
    <CFPROCRESULT name="keyWords">
  </CFSTOREDPROC>
  <cfreturn keyWords>
  </cffunction>
  
  <cffunction name="editAutoBioAssetRecord" access="remote" returntype="any" output="false">
<cfargument name="assetFileName" type ="string" required = "yes">
<cfargument name="assetGroup" type ="numeric" required = "yes">
<cfargument name="assetName" type ="string" required = "yes">
<cfargument name="assetType" type ="numeric" required = "yes">
<cfargument name="id" type ="numeric" required = "yes">
<cfargument name="linkedWord" type ="numeric" required = "yes">
	<cfstoredproc procedure="procEditBioAssetRecord" datasource="cage">
    <cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@assetFileName" value="#assetFileName#">
<cfprocparam cfsqltype="cf_sql_integer" dbvarname="@assetGroup" value="#assetGroup#">
<cfprocparam cfsqltype="cf_sql_varchar" dbvarname="@assetName" value="#assetName#">
<cfprocparam cfsqltype="cf_sql_integer" dbvarname="@assetType" value="#assetType#">
<cfprocparam cfsqltype="cf_sql_integer" dbvarname="@id" value="#id#">
<cfprocparam cfsqltype="cf_sql_integer" dbvarname="@linkedWord" value="#linkedWord#">
    </cfstoredproc>
</cffunction>
  
  
  
</cfcomponent>