status/testing
waitUntilDataTransferIsReady
	| status |
	[
		status := self atStatusReg.
		(self busy: status) &
		(self errorsDidntOccur: status)
	] whileTrue.
	(self errorOccurred: status) ifTrue: [self error: 'An error occurred while reading'].
	 ^self dataReady: status.