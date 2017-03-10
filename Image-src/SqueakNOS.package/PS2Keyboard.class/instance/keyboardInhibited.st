hardware status
keyboardInhibited
	^ (self statusPort anyMask: 16) not