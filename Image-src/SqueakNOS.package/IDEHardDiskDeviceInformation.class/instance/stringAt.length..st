accessing
stringAt: byteOffset length: length
	"Return a structure of the given length starting at the indicated byte offset."
	| value |
	value := String new: length.
	1 to: length do:[:i|
		value
			at: i + (i odd ifTrue: [1] ifFalse: [-1])
			put: (handle unsignedCharAt: byteOffset+i-1)].
	^value