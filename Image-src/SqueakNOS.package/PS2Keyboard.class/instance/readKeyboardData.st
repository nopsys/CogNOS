low level protocol
readKeyboardData
	self waitToReadKeyboard ifFalse: [^nil].
	^self dataPort