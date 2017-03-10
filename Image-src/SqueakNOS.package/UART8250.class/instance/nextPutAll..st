device protocol
nextPutAll: aString
	aString do: [:char | self nextPut: char].