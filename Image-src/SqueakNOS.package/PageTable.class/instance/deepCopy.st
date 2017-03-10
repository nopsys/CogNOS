copying
deepCopy
	| entries size count alien |
	entries := self entriesCount.
	size := self entrySize.
	count :=  entries * size.
	alien := Alien newCPageAligned: count.
	alien copyInto: alien from: 1 to: count in: self handle startingAt: 1.
	^self class handledBy: alien entriesCount: entries entrySize: size