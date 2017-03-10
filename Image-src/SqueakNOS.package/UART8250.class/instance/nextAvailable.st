device protocol
nextAvailable
	| size answer |
	size := receivedChars size.
	answer := String new: size.
	1 to: size do: [:index | answer at: index put: self next].
	^answer