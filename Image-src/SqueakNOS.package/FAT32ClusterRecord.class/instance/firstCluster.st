accessing
firstCluster
	| bytes |
	bytes := ByteArray new: 4.
	contents position: 16r14.
	bytes replaceFrom: 3 to: 4 with: (contents next: 2) startingAt: 1.
	contents position: 16r1A.
	bytes replaceFrom: 1 to: 2 with: (contents next: 2) startingAt: 1.
	^bytes unsignedLongAt: 1