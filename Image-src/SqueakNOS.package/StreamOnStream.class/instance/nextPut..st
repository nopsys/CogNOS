accessing
nextPut: aCharacter
	self atEnd ifFalse: [
		(stream nextPut: aCharacter) ifNotNil: [:char | 
			position := position + 1.
			^char
		]
	]