instance creation
installOn: aComputer
	| memory |
	memory := aComputer memory: (self atMemoryAddress: 0).
	aComputer setInitialMemoryState.
	^memory