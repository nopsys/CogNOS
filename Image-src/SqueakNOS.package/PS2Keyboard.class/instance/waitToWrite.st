low level protocol
waitToWrite
	| delay |
	self inputBufferFull ifFalse: [^true].
	delay := Delay forMilliseconds: 1.
	250 timesRepeat: [
		delay wait.
		self inputBufferFull ifFalse: [^true]
	].
	self report: 'timedout out witing to write.'.
	^false
	