accessing - bist
isBistCapable
	" bit 7 - Return 1 if device supports BIST. Return 0 if the device is not BIST
	capable."

	^ self builtInSelfTest anyMask: 128