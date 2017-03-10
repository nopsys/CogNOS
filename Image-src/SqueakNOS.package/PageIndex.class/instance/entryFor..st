accessing
entryFor: anIndex
	| address handler |
	address := self externalAddressFor: anIndex.
	handler := Alien forPointer: address. 
	^PageTableEntry handledBy: handler