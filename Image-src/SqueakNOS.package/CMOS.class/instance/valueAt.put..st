accessing
valueAt: index put: value 
	^ self isBCD
		ifTrue: [self bcdAt: index put: value]
		ifFalse: [self at: index put: value]