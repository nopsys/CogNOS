as yet unclassified
chunksFrom: firstBlockOfFirstChunk to: firstBlockOfLastChunk
	
	^(firstBlockOfFirstChunk to: firstBlockOfLastChunk by: self chunkSize) collect: [ :firstBlockOfChunk |
		chunks at: firstBlockOfChunk ifAbsent: [ | aByteArray |
			aByteArray := device from: firstBlockOfChunk to: firstBlockOfChunk + self chunkSize - 1.
			chunks at: firstBlockOfChunk put: aByteArray.
			self updateChunk: aByteArray withWritesAt: firstBlockOfChunk.
			aByteArray
		]
	  ]
	
	