services
issueWrite1BlockOf50MB
	| array |
	array := ByteArray new: 50*1024*1024.
	self at: 'Write 1 block of 50 MB' benchmark: [
		controller at: 1 of: 0 putAll: array.
	]  size: 102400 * 512
	
