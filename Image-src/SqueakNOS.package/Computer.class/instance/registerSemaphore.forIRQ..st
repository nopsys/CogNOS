primitives
registerSemaphore: aSemaphore forIRQ: irqNumber 
	| semaIndex |
	semaIndex := Smalltalk registerExternalObject: aSemaphore.
	^ self primRegisterSemaphoreIndex: semaIndex forIRQ: irqNumber