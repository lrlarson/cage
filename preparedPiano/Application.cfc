<cfcomponent
output="false"
hint="I define the application settings and event handlers.">
 
<!---
Define the application. By using the current template
path, we can ensure that our application name completely
unique across the entire server. By using the hash()
function, we make the name more friendly.
--->
<cfset this.name = hash( getCurrentTemplatePath() ) />
 
 

 
</cfcomponent>