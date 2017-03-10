alarm
handleIRQ
	| flags |
	flags := self statusC.
	(flags anyMask: 16r20) ifTrue: [
		"registerC must be read to clear the interrupt bits,
		 otherwise, the interrupt is generated again"
		self alarmBlock value.
	].
	self uninstallAlarm.