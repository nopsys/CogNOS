as yet unclassified
replaceFromByte: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset
	"Transcript show: 'Writing from: ', destOffset, ' count: ', bytesCount, '
	'."
	writeList at: destOffset wrote: (source copyFrom: sourceOffset to: sourceOffset + bytesCount - 1).
	
	self updateChunksFrom: destOffset bytesCount: bytesCount with: source startingAtByte: sourceOffset.
		