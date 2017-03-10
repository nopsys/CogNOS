irq handling
handleKbdEvent
	| count |
	count := 1.
	self readStatus.
	[self outputBufferFull]
		whileTrue: 
			[self nextData.
			self checkError
				ifFalse: [self auxOutputBufferFull
					ifTrue: [self processMouseScanCode: lastScanCode]
					ifFalse: [self processScanCode: lastScanCode]].
			count := count + 1.
			count = 1000
				ifTrue: 
					[Transcript cr; show: 'Error de teclado'.
					^ self].
			self readStatus]