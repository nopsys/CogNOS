accessing - control status
initializationBlock
	^ self is16
		ifTrue: [LanceNICInitializationBlock16 fromHandle: (
			ExternalAddress new fromInteger: (self initializationBlockAddress))]
		ifFalse: [self notYetImplemented]
