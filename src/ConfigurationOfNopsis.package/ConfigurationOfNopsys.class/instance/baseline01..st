as yet unclassified
baseline01: spec 
  <version: '0.1-baseline'>

	spec for: #common do: [
		spec blessing: #baseline.
 	  spec repository: 'github://charig/Nopsys:master'.
		"Package inlcuded in the project"
		spec package: 'ExamplePackage'.
		"Package inlcuded in the project from another repo"
		spec
  			package: 'ExamplePackage2'
  			with: [
  	  		spec repository: 'url' 
			].
		
		"Package depending on other project"
		spec package: 'ExamplePackage3' with: [ spec requires: 'ExamplePackage1' ].
		
		"External project having a metacello config"
		spec project: 'Roassal' with: [
  			spec
   		 		className: 'ConfigurationOfRoassal';
    			file: 'ConfigurationOfRoassal';
    			version: #development;
    			repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal/main' 
		]
  	]