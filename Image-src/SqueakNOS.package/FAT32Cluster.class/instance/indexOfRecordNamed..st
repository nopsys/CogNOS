private
indexOfRecordNamed: aString
	self records withIndexDo: [:record :index | (record name asLowercase = aString asLowercase) ifTrue: [^index]].
	self error: 'Not found'