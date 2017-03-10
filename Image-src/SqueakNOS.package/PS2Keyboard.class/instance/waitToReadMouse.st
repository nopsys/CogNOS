low level protocol
waitToReadMouse
	| delay |
	self mouseOutputBufferFull ifTrue: [^true].
	delay := Delay forMilliseconds: 1.
	250 timesRepeat: [
		delay wait.
		self mouseOutputBufferFull ifTrue: [^true]
	].
	self report: 'timedout out witing for mouse input.'.
	^false
	