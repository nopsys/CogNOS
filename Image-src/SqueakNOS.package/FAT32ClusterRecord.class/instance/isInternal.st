testing
isInternal
	^self isDirectory and: [self name = '.' or: [self name = '..']]
	