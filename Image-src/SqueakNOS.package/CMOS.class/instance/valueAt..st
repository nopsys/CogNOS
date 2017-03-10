accessing
valueAt: index 
	^ self isBCD
		ifTrue: [self bcdAt: index]
		ifFalse: [self at: index]