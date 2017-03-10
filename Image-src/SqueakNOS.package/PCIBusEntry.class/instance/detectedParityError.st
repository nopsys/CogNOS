accessing - status
detectedParityError
	" bit 15 - This bit must be set by the device whenever it detects a parity error,
	even if parity error handling is disabled (as controlled by bit 6 in the
	Command register)."

	^ self statusBit: 15