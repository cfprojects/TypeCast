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
		<a name="top" />
		<cfparam name="url.classPath" default="/Applications/ColdFusion8/wwwroot/WEB-INF/lib/cfmx_bootstrap.jar" />
		<cfset classPath = url.classPath>
		<cfzip action="list" file="#classPath#" name="classes" showDirectory="false" />
		<!---
		<cfdump var="#variables#" />
		 --->
		<cfquery name="sortedClasses" dbtype="query">
			SELECT *
			FROM classes
			ORDER BY directory, name
		</cfquery>
		<a href="listJars.cfm">Back to jarfile list</a><br />
		Jump to:
		<cfoutput query="sortedClasses" group="directory">
			<cfif NOT find("META-INF",directory)>
				<cfif directory NEQ ""><a href="###listChangeDelims(directory,".","/")#">#listChangeDelims(directory,".","/")#</a><cfelse><a href="##root">Package Root</a></cfif>&nbsp
			</cfif>
		</cfoutput>
		<cfoutput query="sortedClasses" group="directory">
			<cfif NOT find("META-INF",directory)>
				<cfif directory NEQ "">
					<cfset dir = listChangeDelims(directory,".","/")>
				<cfelse>
					<cfset dir = "Package Root">
				</cfif>
				<cfhtmlhead text="<title>#dir#</title>" />
				<a name="#dir#" />
				<h1>#dir#</h1>
				<a href="##top">Back to Top</a><br /><br />
				<cfoutput>
					<cfset classType = listChangeDelims(replace(name,".class","","all"),".","/")>
					<a href="classDetails.cfm?classpath=#classPath#&class=#classType#">#classType#</a><br />
				</cfoutput>
			</cfif>
		</cfoutput>
	</body>
</html>