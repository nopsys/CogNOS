services
writeFrom: aNumber with: stringOrByteArray startingAt: anotherNumber count: count
	contents position: aNumber.
	contents nextPutAll: (stringOrByteArray copyFrom: anotherNumber to: anotherNumber + count - 1) asByteArray.
	^count