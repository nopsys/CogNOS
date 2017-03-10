irq handling
handleIRQ
	| statusOnEntry |
	statusOnEntry := self interruptStatus.
	"Status contents: self statusString."	"Status := TextMorph new openInWorld"
	[	self receiveInterruptPending ifTrue: [self handleReceiveInterrupt].
		self receiveBufferOverflowInterruptPending ifTrue: [self handleReceiveBufferFull].
	] ifError: [:ex | Transcript show: ex; cr; flush].

	"reset every interrupt, as they where on entry to avoid race conditions"
	self interruptStatus: statusOnEntry.