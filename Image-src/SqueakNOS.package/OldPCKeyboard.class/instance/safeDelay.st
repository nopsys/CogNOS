commands support
safeDelay
	250
		timesRepeat: 
			[self handleKbdEvent.
			self inputBufferFull ifFalse: [^ self].
			(Delay forMilliseconds: 1) wait]