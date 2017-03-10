accessing
size: aNumber
	| bytes |
	bytes := ByteArray new: 4.
	bytes unsignedLongAt: 1 put: aNumber.
	contents position: 16r1C.
	^contents nextPutAll: bytes