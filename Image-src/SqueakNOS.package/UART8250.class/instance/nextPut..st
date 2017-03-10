device protocol
nextPut: aCharacter
	self xmitByte: aCharacter asInteger.
	^ aCharacter