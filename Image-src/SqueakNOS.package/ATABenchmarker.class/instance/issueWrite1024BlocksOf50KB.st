services
issueWrite1024BlocksOf50KB
	| array |
	array := ByteArray new: 50*1024.
	self at: 'Write 1024 blocks of 50 KB' benchmark: [ | offset | offset := 0.
		1024 timesRepeat: [
			controller issueWrite: array at: offset device: 0 timeout: 5000.
			offset := offset + 100.
		]
	]  size: 102400 * 512
	
