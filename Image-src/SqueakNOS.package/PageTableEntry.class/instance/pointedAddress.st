private
pointedAddress
	| address |
	address := handle unsignedLongAt: 1.
	^address bitAnd: 16rFFFFF000