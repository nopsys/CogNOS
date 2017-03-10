testing
isPresentAndForbidden 
	| value |
	value := handle unsignedLongAt: 1.
	value := value bitAnd: 16r00000003.
	^value = 16r1 