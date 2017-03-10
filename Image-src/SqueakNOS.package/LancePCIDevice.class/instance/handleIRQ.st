irq handling
handleIRQ
	| statusOnEntry |
	statusOnEntry := self status.
	[
	self receiveInterruptPending
		ifTrue: [self handleReceiveInterrupt].
	self transmitInterruptPending
		ifTrue: [].
	] on: Error do: [:ex | Transcript show: ex; cr].
	self status: statusOnEntry