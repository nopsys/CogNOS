as yet unclassified
contents
	| result | 
	result := ByteArray new: size.
	pointer copyInto: result from: 1 to: size in: pointer startingAt: 1.
	^result.
