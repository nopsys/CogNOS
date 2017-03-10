accessing - bist
bistCompletionCode
	" bits 0-3 - A value of 0 means the device has passed its test. Non-zero values
	mean the device failed. Device-specific failure codes can be encoded
	in the non-zero value."
	^ self builtInSelfTest bitAnd: 15