flushing
flushProcess
	^
	[ 
		(Delay forSeconds: 10) wait. 
		self flushFatChanges.
		self flushClusterChanges.
	] fork.
		
		