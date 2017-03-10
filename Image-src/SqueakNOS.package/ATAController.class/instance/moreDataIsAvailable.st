status/testing
moreDataIsAvailable
	"We should remove this method, it does the same than waitUntilDataTransferIsReady"
	| status time |
	time := 0.
	[status := self atStatusReg. (self busy: status) & (self errorsDidntOccur: status) and: [ time < 10 ]] whileTrue:
		[time := time + 1. (Delay forMilliseconds: 1) wait ]..
	(self errorOccurred: status) ifTrue: [self error: 'An error occurred while reading'].
	time >= 10 ifTrue: [Transcript show: 'Read timeout. Status: ', status, Character cr ].
	"tells wheter data port contains more data available. This happens if:"
	 ^ (self dataReady: status)" & (self errorsDidntOccur: status)".