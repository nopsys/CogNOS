irq handling
handleIRQ
	self hasCardRemovalInterrupt ifTrue: [
		self clearCardRemovalInterrupt.
		self checkCardPresent].
	self hasCardInsertionInterrupt ifTrue: [
		self clearCardInsertionInterrupt.
		self checkCardPresent].
	self hasCommandCompleteInterrupt ifTrue: [
		self clearCommandCompleteInterrupt].