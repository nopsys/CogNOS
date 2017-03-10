testing
isPresent
	| value |
	value := handle unsignedLongAt: 1.
	value := value bitAnd: 16r00000001.
	^value = 16r1 