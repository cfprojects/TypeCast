<html>
	<head>
		<title>CF 8 Jar Files</title>
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
		<cfdirectory action="list" directory="/Applications/ColdFusion8/" filter="*.jar" name="jarFiles" recurse="true" />
		<!---
		<cfdump var="#variables#" />
		<cfabort />
		 --->
		<h1>Jar files in the ColdFusion 8.0.1 install folder</h1>
		<table cellpadding="1" cellspacing="0" border="1">
			<tr>
				<th>
					Path
				</th>
				<th>
					Size
				</th>
				<th>
					Link
				</th>
			</tr>
		<cfoutput query="jarFiles">
			<tr>
				<td>
					&nbsp;&nbsp;#directory#/#name#&nbsp;&nbsp;
				</td>
				<td>
					&nbsp;&nbsp;
					<cfif size GT 1000000>
					#decimalFormat(size/1000000)# M
					<cfelse>
					#decimalFormat(size/1000)# K
					</cfif>
					&nbsp;&nbsp;
				</td>
				<td>
					&nbsp;&nbsp;<a href="listClasses.cfm?classPath=#directory#/#name#">View Classes</a>&nbsp;&nbsp;
				</td>
			</tr>
		</cfoutput>
		</table>
	</body>
</html>