private
status
	| value |
	value := handle unsignedLongAt: 1.
	^value := value bitAnd: 16r00000FFF