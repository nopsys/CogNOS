accessing
finishClustersChainValue
	| bytes |
	bytes := (ByteArray new: 4).
	bytes unsignedLongAt: 1 put: 16r0FFFFFFF.	
	^bytes