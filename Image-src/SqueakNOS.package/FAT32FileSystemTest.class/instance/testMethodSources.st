as yet unclassified
testMethodSources
"	| image sources |
	image := SmalltalkImage current.
	[image openSourceFilesForSqueakNos.
	sources := SmalltalkImage methodDictionary at: #argumentAt:.
	self
		assert: (sources getSource string includesSubString: 'argumentAt: i')]
		ensure: [image openSourceFiles]"