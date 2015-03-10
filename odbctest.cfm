<cfquery 
  name="test" datasource="odbctest">
  SELECT test
  FROM test
</cfquery>
  <cfoutput query="test">
      <b>#test#</b>
</cfoutput>