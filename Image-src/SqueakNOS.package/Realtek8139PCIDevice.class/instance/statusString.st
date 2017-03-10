transmiting
statusString
	^ String streamContents: [:strm |
		Time now printOn: strm.
		strm nextPutAll: ' IRQ:'.
		self interruptStatus printOn: strm base: 16.
		strm nextPutAll: ' Tx0:'.
		(self transmitStatus: 0) printOn: strm base: 16.
		strm nextPutAll: ' Tx1:'.
		(self transmitStatus: 1) printOn: strm base: 16.
		strm nextPutAll: ' Tx2:'.
		(self transmitStatus: 2) printOn: strm base: 16.
		strm nextPutAll: ' Tx3:'.
		(self transmitStatus: 3) printOn: strm base: 16]
