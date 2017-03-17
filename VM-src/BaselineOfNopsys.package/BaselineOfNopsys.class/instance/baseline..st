as yet unclassified
baseline: spec
   <baseline>

   "Here we should define all the dependencies"
	spec for: #common do: [
		spec preLoadDoIt: #installVMMaker.
		spec package: 'SqueakNOS-VM'.
	]