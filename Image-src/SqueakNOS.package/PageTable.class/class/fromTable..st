instance creation
fromTable: aPageTable
	| count alien |
	count := aPageTable entriesCount * aPageTable entrySize.
	alien := Alien newCPageAligned: count.
	alien copyInto: alien from: 1 to: count in: aPageTable handle startingAt: 1.
	^self handledBy: alien entriesCount: aPageTable entriesCount entrySize: aPageTable entrySize 