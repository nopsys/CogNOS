accessing
firstCluster: aNumber
	| bytes |
	bytes := ByteArray new: 4.
	bytes unsignedLongAt: 1 put: aNumber.
	contents position: 16r14.
	contents nextPutAll: (bytes copyFrom: 3 to: 4).
	contents position: 16r1A.
	contents nextPutAll: (bytes copyFrom: 1 to: 2).
	