as yet unclassified
flushWrites
	| helper buffer |
	self halt.
	helper := BlockArithmetic new size: self blockSize.
	writeList do: [ :byteStart :byteEnd :segments |
	
		helper alignedStart: byteStart end: byteEnd with: [ :alignedByteStart :alignedByteEnd  |
			buffer := ByteArray new: alignedByteEnd - alignedByteStart + 1.
			self readHalfWrittenSectorsInto: buffer start: byteStart end: byteEnd.
		
			segments do: [ :aSegment | 
				buffer replaceFrom: (aSegment at: 1) - alignedByteStart + 1
					    to: (aSegment at: 1) - alignedByteStart + (aSegment at: 2) size
					    with: (aSegment at: 2) startingAt: 1
			].

			device at: (helper blockNumberOf: alignedByteStart) writeArray: buffer.
		
		]
	].

	writeList clear.
	
	