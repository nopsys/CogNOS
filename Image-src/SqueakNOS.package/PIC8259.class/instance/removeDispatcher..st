dispatching
removeDispatcher: anIRQDispatcher
	^ self dispatcher: nil forIRQ: anIRQDispatcher interruptNumber