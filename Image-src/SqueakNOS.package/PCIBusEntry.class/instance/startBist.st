accessing - bist
startBist
	" bit 6 - Write a 1 to invoke BIST. Device resets the bit when BIST is complete.
	Software should fail the device if BIST is not complete after 2 seconds."

	^ self builtInSelfTest: (self builtInSelfTest bitOr: 64)