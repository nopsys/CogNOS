as yet unclassified
at: aBlockNumber count: blocksCount
	"Retrieve sector number aBlockNumber from device"
	| result | 
	result := deviceA at: aBlockNumber count: blocksCount.
	(deviceB at: aBlockNumber count: blocksCount) = result ifFalse: [ self error: 'Read failed' ].
	^result.