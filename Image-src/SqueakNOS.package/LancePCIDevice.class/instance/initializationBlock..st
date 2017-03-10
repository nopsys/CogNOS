accessing - control status
initializationBlock: aLanceNICInitBlock
	aLanceNICInitBlock is16
		ifTrue: [
			self
				softwareStyleRegister: 0;
				initializationBlockAddress: aLanceNICInitBlock address]
		ifFalse: [self notYetImplemented]
