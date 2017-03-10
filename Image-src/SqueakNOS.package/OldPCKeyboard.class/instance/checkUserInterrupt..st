irq handling
checkUserInterrupt: key
	| answer |
	answer := self commandKeyPressed and: [key = $.].
	answer ifTrue: [Sensor signalUserInterrupt].
	^answer