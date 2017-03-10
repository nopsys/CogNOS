printing
printOn: aStream
	self entries withIndexDo: [ :entry :index | 
		aStream nextPutAll: 'Table ', index printString, ': ', entry printString; cr.
	]