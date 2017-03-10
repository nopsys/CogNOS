services
issueRead102400BlocksOf512Bytes
	self at: 'Read 102400 blocks of 512 Bytes' benchmark: [ | offset | offset := 0.
		102400 timesRepeat: [
			controller issueReadFrom: offset count: 1 device: 0 timeout: 5000.
			offset := offset + 1.
		]
	] size: 102400 * 512.
	
