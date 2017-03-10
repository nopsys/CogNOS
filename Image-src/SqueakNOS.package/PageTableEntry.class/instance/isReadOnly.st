testing
isReadOnly 
	| value |
	value := handle unsignedLongAt: 1.
	value := value bitAnd: 16r00000010.
	^value = 16r2 