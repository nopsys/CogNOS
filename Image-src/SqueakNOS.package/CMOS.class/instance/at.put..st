accessing
at: index put: value 
	self byteAt: 0 put: index.
	^ self byteAt: 1 put: value