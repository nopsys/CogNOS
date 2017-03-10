accessing
bcdAt: index put: value 
	^ self at: index put: value // 10 * 16 + (value \\ 10)