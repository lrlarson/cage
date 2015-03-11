


<cfobject type="Java" class="com.xuggle.mediatool.ToolFactory" name="myToolFactory">

<cfset myReader = createobject('java','com.xuggle.mediatool.ToolFactory').makeReader("c:/test.flv")>

 <!---IMediaReader reader = ToolFactory.makeReader("videofile.flv");
 <cfset reader = myToolFactory.makeReader("Locale_210_c.mov")>
// add a viewer to the reader, to see the decoded media
 <cfset reader.addListener(ToolFactory.makeWriter("output.mov", reader));
 
 // read and decode packets from the source file and
 // and dispatch decoded audio and video to the writer
 while (reader.readPacket() == null)
   ;
--->
