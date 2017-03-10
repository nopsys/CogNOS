ports
byteAt: index
	| r |
	r := super byteAt: index.
"	self report: ' at: ', index printString, ' -> ', r hex.
"	^ r