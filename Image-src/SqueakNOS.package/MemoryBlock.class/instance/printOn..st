printing
printOn: aStream
	^aStream nextPutAll: self interval first printString; nextPut: $-; nextPutAll: self interval last printString; nextPut: $(;nextPutAll: self description; nextPut: $)