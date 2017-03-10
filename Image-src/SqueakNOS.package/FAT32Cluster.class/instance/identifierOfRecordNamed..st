private
identifierOfRecordNamed: aString
	self records withIndexDo: [:record :index | (record name asLowercase = aString asLowercase) ifTrue: [^record firstCluster]].
	self error: 'Not found'