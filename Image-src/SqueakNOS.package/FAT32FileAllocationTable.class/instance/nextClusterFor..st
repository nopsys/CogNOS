accessing
nextClusterFor: index
	self setPositionTo: index.
	^self nextRecord unsignedLongAt: 1.