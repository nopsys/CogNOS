as yet unclassified
callout: anArray
	| answer |
	answer := self primOFWCallout: anArray.
	answer = 0 ifFalse: [^ self error: 'OpenFirmware calout returned error: ', answer printString]