services
issueRead1BlockOf50MB
	self at: 'Read 1 block of 50 MB' benchmark: [
		controller at: 1 count: 102400 of: 0.
	]  size: 102400 * 512
	
