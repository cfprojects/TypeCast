<html>
	<head>
		<style>
			body {
				font-family: sans-serif;
			}
			th {
				background-color: silver;
				font-weight: bold;
			}
			th,td {
				font-size: 11px;
			}
		</style>
	</head>
	<body>
		<cfoutput>
		<a href="listJars.cfm">Back to jarfile list</a><br />
		<a href="listClasses.cfm?classPath=#url.classPath#">Back to class list</a><br />
		</cfoutput>
		<cfif listContains(url.class,"prop",".")>
			<br /><br />
			Properties File Contents:
			<cfset entryPath = listChangeDelims(url.class,"/",".")>
			<cfset lastDelim = entryPath.lastIndexOf("/")+1>
			<cfset entryPath = mid(entryPath,1,lastDelim-1) & "." & mid(entryPath,lastDelim+1,len(entryPath)-lastDelim)>
			<cfhtmlhead text="<title>#entryPath#</title>" />
			<cfzip action="read" file="#url.classpath#" entrypath="#entryPath#" variable="javapData" />
		<cfelse>
			<br /><br />
			Parsed classfile methods and properties:
			<cfset args = ["-classpath",url.classPath,url.class,"-private"]>
			<cfhtmlhead text="<title>#url.class#</title>" />
			<cfexecute name="/usr/bin/javap"  arguments="#args#" variable="javapData" errorVariable="error" timeout="30" />
		</cfif>
<pre>
<cfoutput>#javapData#</cfoutput>
</pre>
<!---
eventually we can use something like this to determine if a string is a classname and make them into links

<cfset counter = 1>
<cfset rslt = {len=[1],pos=[1]}>
<cfloop condition="rslt.pos[1]+rslt.len[1] LT len(javapData)">
	<cfif counter GT 300>ABORTING RUNAWAY PROCESS!!!!!!<cfabort /></cfif>
	<cfset rslt = reFindNoCase("\b[\w\.\$]+\b",javapData,rslt.pos[1],"true")>
	<cfoutput>
		position: #rslt.pos[1]# length: #rslt.len[1]#<br />
		#mid(javapData,rslt.pos[1],rslt.len[1])#<br />
	</cfoutput>
	<cfset rslt.pos[1] = rslt.pos[1]+rslt.len[1]+1>
	<cfset counter = counter + 1>
	<cfflush />
</cfloop>
--->
	</body>
</html>