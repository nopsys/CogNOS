private
addClustersTo: aFilesystemContent count: aNumber
	| clusters |
	Transcript show: aNumber printString, Character cr asString.
	clusters := OrderedCollection new.
	aNumber timesRepeat: [clusters add: (self addClusterTo: aFilesystemContent)].
	^clusters