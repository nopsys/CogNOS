low level protocol
readMouseData
	self waitToReadMouse ifFalse: [^nil].
	^self dataPort.