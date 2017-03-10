private
readAllAvailable
	| answer |
	answer := ''.
	[ self moreDataIsAvailable ] whileTrue: [answer := answer, self readSector].
	(answer = '') ifTrue: [
		 Transcript show: 'Status: ', self atStatusReg asString, Character cr asString.
		 self error: 'No grabe nada' ].
	^answer.
