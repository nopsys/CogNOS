as yet unclassified
writeFrom: firstByte to: lastByte into: aByteArray
	| helper | 
	helper := BlockArithmetic new blockSize: aByteArray size.
	
	"self halt."
	writeQueue do: [ :write | | sourceStart sourceEnd |
		sourceStart := write at: 1.
		sourceEnd := sourceStart + (write at: 2) size - 1.
		(self areIntersected: firstByte to: lastByte and: sourceStart to: sourceEnd) ifTrue: [ | destStart destEnd |
			destStart := helper positionInBlockOf: (firstByte max: sourceStart).
			destEnd := helper positionInBlockOf: (lastByte min: sourceEnd).
			aByteArray replaceFrom: destStart to: destEnd with: (write at: 2) startingAt: (firstByte - sourceStart + 1 max: 1)
		]
	]