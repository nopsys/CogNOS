accessing
pageTable
	| address |
	address := self pointedAddress.
	^PageTable forPointer: address