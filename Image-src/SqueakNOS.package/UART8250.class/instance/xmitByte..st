accessing
xmitByte: value
	| process delay timeout |
	timeout := false.
	delay := Delay forSeconds: 5.
	process := 
			[delay wait.
			timeout := true]
				forkAt: Processor lowIOPriority.
	[self readLineStatus.
	timeout | self testTHR] whileFalse.
	timeout ifTrue: [Transcript cr; show: 'TimeOut'. ^self].
	"delay unschedule."
	process terminate.
	self byteAt: 0 put: value