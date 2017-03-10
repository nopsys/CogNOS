services
issueWrite102400BlocksOf512Bytes
	| array |
	array := ByteArray new: 512.
	self at: 'Write 102400 blocks of 512 Bytes' benchmark: [ | offset | offset := 0.
		102400 timesRepeat: [
			controller issueWrite: array at: offset device: 0 timeout: 5000.
			offset := offset + 1.
		]
	]  size: 102400 * 512
	
