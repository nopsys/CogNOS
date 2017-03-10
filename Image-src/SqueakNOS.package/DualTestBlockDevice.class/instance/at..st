as yet unclassified
at: aBlockNumber 
	"Retrieve sector number aBlockNumber from device"
	| result | 
	result := deviceA at: aBlockNumber.
	(deviceB at: aBlockNumber) = result ifFalse: [ self error: 'Read failed' ].
	^result.