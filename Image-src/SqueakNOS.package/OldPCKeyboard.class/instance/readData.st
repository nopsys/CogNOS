commands support
readData
	| answer |
	self readStatus.
	self outputBufferFull ifFalse: [^ nil].
	answer := self nextData.
	^ self checkError
		ifTrue: 
			[Transcript cr; show: 'Error in #readData: ', (status printStringBase: 2).
			nil]
		ifFalse: [answer]