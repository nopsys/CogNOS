testing
isAuxPortPresent
	self auxWriteToOutBuffer: 16r5A.
	10
		timesRepeat: 
			[self readStatus.
			self nextData.
			self auxOutputBufferFull ifTrue: [^ true].
			(Delay forMilliseconds: 1) wait].
	^false