services
issueRead1024BlocksOf50KB
	self at: 'Read 1024 blocks of 50 KB' benchmark: [ | offset | offset := 0.
		1024 timesRepeat: [
			controller issueReadFrom: offset count: 100 device: 0 timeout: 5000.
			offset := offset + 100.
		]
	] size: 102400 * 512
	
