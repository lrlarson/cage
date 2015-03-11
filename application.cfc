<cfcomponent
output="false"
hint="I define the application settings and event handlers.">
 
<!---
Define the application. By using the current template
path, we can ensure that our application name completely
unique across the entire server. By using the hash()
function, we make the name more friendly.
--->
<cfset this.name = 'cage' />
 
<!--- 
<cffunction
name="onRequest"
access="public"
returntype="void"
output="true"
hint="I execute the current request.">
 

 
Current Template Path:<br />
#getCurrentTemplatePath()#<br />
 
<br />
 
Hash Of Template Path:<br />
#hash( getCurrentTemplatePath() )#<br />
 
</cffunction>
 --->
</cfcomponent>