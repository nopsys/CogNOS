low level protocol
disableIRQsWhile: aBlock
	| answer |
	self controllerCommand: 16r60; dataPort: 0.
	answer := aBlock value.
	self controllerCommand: 16r60; dataPort: 16r47.
	^ answer
