instance creation
entriesCount: aNumber entrySize: anotherNumber
	| alien |
	alien := (Alien newCPageAligned: aNumber * anotherNumber).
	^self handledBy: alien entriesCount: aNumber entrySize: anotherNumber