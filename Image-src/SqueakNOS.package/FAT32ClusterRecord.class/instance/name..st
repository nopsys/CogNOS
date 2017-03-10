accessing
name: aString
	aString size = 11 ifFalse: [self error: 'The string is not in a suitable format'].
	contents position: 0.
	contents nextPutAll: aString asByteArray
	
