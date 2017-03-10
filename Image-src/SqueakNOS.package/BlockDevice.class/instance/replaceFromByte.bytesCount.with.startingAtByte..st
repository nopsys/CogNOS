as yet unclassified
replaceFromByte: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset
	"Write count bytes from source starting at startIndex bytes. We handle half sector
	 overwriting."
	cache replaceFromByte: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset.