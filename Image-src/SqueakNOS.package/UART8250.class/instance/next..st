device protocol
next: anInteger
	| answer |
	answer := ByteArray new: anInteger.
	1 to: anInteger do: [:index | answer at: index put: self next].
	^answer