services
waitUntilReadyOr: maxMilliseconds
	| time status |
	time := Time millisecondClockValue.
	
	[ status := self atStatusReg. (self driveReady: status) not and: [ Time millisecondClockValue - time < maxMilliseconds ] ] whileTrue.
	
	"Time millisecondClockValue - time >= maxMilliseconds ifTrue: [Transcript show: 'Ready timeout. Status: ', status, Character cr ]."