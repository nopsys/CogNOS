instance creation
fromTable: aPageTable size: aNumber
	^(self newCPageAligned: aNumber) copyInto: self from: 0 to: aNumber - 1 in: aPageTable startingAt: 0