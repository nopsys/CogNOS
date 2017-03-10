private
readAllAvailable: sectorCount
	| answer nextPosition |
	answer := ByteString new: sectorCount * self sectorSize.
	nextPosition := 1.
	[ self moreDataIsAvailable ] whileTrue: [
		answer replaceFrom: nextPosition to: nextPosition + self sectorSize - 1 with: self readSector startingAt:1.
		nextPosition := nextPosition + self sectorSize.
	].
	(answer = '') ifTrue: [
		 Transcript show: 'Status: ', self atStatusReg asString, Character cr asString.
		 self error: 'No grabe nada' ].
	^answer.
