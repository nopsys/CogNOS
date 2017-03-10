printing
printOn: aStream
	self entries withIndexDo: [ :entry :index | 
		aStream nextPutAll: 'Page ', index printString, ': ', entry printString; cr.
	]