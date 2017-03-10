dispatching
dispatcherForIRQ: aNumber
	^ aNumber > 7
		ifTrue: [slave dispatcherForIRQ: aNumber - 8]
		ifFalse: [dispatchers at: aNumber + 1].