dispatching
dispatcher: anIRQDispatcher forIRQ: aNumber
	^ aNumber > 7
		ifTrue: [slave dispatcher: anIRQDispatcher forIRQ: aNumber - 8]
		ifFalse: [dispatchers at: aNumber + 1 put: anIRQDispatcher]