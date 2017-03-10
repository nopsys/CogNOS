accessing
removeHandler: anObject
	" should not be called from a handler routine,
	as it may terminate the process if it's the last handler,
	in which case the interrupt will not be finished signaling the interruptController.
	XXX: This must be solved, there must be a clean wat of doing one time IRQs"
	clients remove: anObject.
	clients ifEmpty: [self uninstall].