printing
printOn: aStream
	aStream nextPutAll: 'Translates to: ', self pointedAddress printString, ', Status bits: ', self status printString.