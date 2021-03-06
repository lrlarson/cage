<cfcomponent>

<cffunction name="uploadImage" access="remote" returntype="struct">

<cfargument name="image" required="yes" type="string">


<cfset thisDir = expandPath(".")> 
<!--- Determine whether the form is uploaded with the image. ---> 
<cfif (1 EQ 1)> 
    <!--- Use the cffile tag to upload the image file. ---> 
    <cffile action="upload" fileField="image" destination="#thisDir#" result="fileUpload" 
        nameconflict="makeunique"> 
    <!--- Determine whether the image file is saved. ---> 
    <cfif fileUpload.fileWasSaved> 
    <!--- Determine whether the saved file is a valid image file. ---> 
        <cfif IsImageFile("#fileUpload.serverfile#")> 
    <!--- Read the image file into a variable called myImage. ---> 
            <cfimage action="read" source="#fileUpload.serverfile#" name="myImage"> 
            <!--- Determine whether the image file exceeds the size limits. ---> 
            <cfif ImageGetHeight(myImage) gt 400 or ImageGetWidth(myImage) gt 400> 
                <!--- If the file is too large, delete it from the server. ---> 
                <cfset resultDescription = "File is too large">
                <cfset result = "fail">
                <cffile action="delete" 
                    file="#fileUpload.serverDirectory#/#fileUpload.serverFile#"> 
                   <cfset newFIleName =  #fileUpload.serverFile#>
            <cfelse> 
 
    <cfset ImageScaleToFit(myImage,75,75,"bilinear")> 
                <!--- Specify the new filename as the source filename with 
                    "_thumbnail" appended to it. ---> 
                <cfset newImageName = fileUpload.serverDirectory & "/" & 
                    fileUpload.serverFilename & "_thumbnail." & 
                    fileUpload.serverFileExt> 
                <!--- Save the thumbnail image to a file with the new filename. ---> 
                <cfimage source="#myImage#" action="write" 
                    destination="#newImageName#" overwrite="yes">
                    <cfset newThumbName = fileUpload.serverFilename & "_thumbnail." & fileUpload.serverFileExt> 
                   <cfset resultDescription = "File Accepted">
               		<cfset result = "Success">   
             
            </cfif> 
        <!--- If it is not a valid image file, delete it from the server. ---> 
        <cfelse> 
            <cffile action="delete" 
                file="#fileUpload.serverDirectory#/#fileUpload.serverFile#"> 
                 <cfset resultDescription = "Not an image file">
                <cfset result = "fail">
        </cfif> 
    </cfif> 
</cfif>

<cfset myStruct=StructNew()>
<cfset myStruct.resultDescription = #resultDescription#>
<cfset myStruct.result = #result#>
<cfset myStruct.fileName = #newFileName#>
<cfset myStruct.thumbFileName = #newThumbName#>

<cfreturn myStruct>
</cffunction>

</cfcomponent>