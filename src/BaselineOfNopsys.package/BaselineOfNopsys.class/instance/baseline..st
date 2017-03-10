as yet unclassified
baseline: spec
   <baseline>

   "Here we should define all the dependencies"
	spec for: #common do: [
		spec
      		configuration: 'VMMaker' with: [
           		Metacello new
						filetreeDirectory: '../VMMaker/mc';
						baseline: 'Spur';
						load 
			];
         yourself.
		spec
         package: 'SqueakNOS-VM' with: [ spec requires: #('VMMaker') ].
			
	]