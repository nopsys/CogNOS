accessing
checkError
	(lineStatus bitAnd: 16r1E) = 0
		ifFalse: [Transcript cr; show: 'Error LSR/UART ', lineStatus printStringHex]