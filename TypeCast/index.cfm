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
		<h1>TypeCast, the JavaP browser for ColdFusion</h1>
		<p>
			Please keep in mind that this is barely alpha software, so bugs will occur. If you don't mind, please go to
			<a href="http://typecast.riaforge.org/index.cfm?event=page.addissue">the bug tracker</a> and add any bugs you find.
			Every attempt will be made to fix them promptly.
		</p>
		<p>
			If you wish you can view the <a href="./README.html">readme file</a>.
		</p>
		<p>
			To get started, click the link below to view all the jar files in your ColdFusion install folder. You
			might need to edit listJars.cfm and change the install location for ColdFusion. Then click the link
			below to list the jar files in your CF install. Jar files are listed in alphabetical order.
		</p>
		<p>
			Currently TypeCast is targeted toward ColdFusion 8 Standalone. If you are using MultiServer,
			simply point the install folder at your ColdFusion instance's root folder:
		</p>
		<p>
			{cfusion_home}/servers/cfusion-ear/cfusion-war/WEB-INF
		</p>
		<p>
			While this won't show you the JRun jars available to you, it will reveal the ColdFusion-specific
			jar files available... which, in the end, is what this application was intended to do.
		</p>
		<p>
			You may wish to start by hitting cfusion.jar to see all the ColdFusion-specific Java classes
			available to you. Using this to find ColdFusion Java classes will enable you to find the classes
			specific to a particular ColdFusion object, for example, clicking cfusion.jar, then clicking
			coldfusion.runtime and finding coldfusion.runtime.Struct in the list of classes will reveal to you
			that you can call structNew().StructCount() (which will always return 0) where StructCount() is a Java
			function available on a struct. structNew().StructInsert() is also available, as are many other functions
			commonly used in the format structInsert(struct).
		</p>
		<p>
			Upcoming features include, but aren't limited to:
		</p>
		<ul>
			<li>Fixing a currently known but not well understood error that comes up when viewing certain classes</li>
			<li>Class name linking, so you can just click a class listed in the output on a class details page</li>
			<li>Class name linking to JavaDocs for Java classes</li>
			<li>Content caching</li>
			<li>A preferences/setup page and config file</li>
			<li>Better support for Multiserver/J2EE installations</li>
			<li>Adding the codebase to the RIAForge SVN repository</li>
		</ul>
		<a href="./listJars.cfm">List jar files in your CF install folder</a>
	</body>
</html>