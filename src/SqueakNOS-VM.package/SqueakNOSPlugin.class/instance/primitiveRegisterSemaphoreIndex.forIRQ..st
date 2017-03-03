semaphore
primitiveRegisterSemaphoreIndex: aSemaphoreIndex forIRQ: irqNumber
	| IRQSemaphores |

	self primitive: 'primitiveRegisterSemaphoreIndexForIRQ'
		parameters: #(SmallInteger SmallInteger).

	self var: #IRQSemaphores type: 'extern t_IRQSemaphores'.

	irqNumber < (IRQSemaphores sizeof/(IRQSemaphores at: 0) sizeof)
			ifTrue: [IRQSemaphores at: irqNumber put: aSemaphoreIndex]
			ifFalse: [interpreterProxy primitiveFail].

	^ interpreterProxy trueObject