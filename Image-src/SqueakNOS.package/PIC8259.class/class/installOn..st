instance creation
installOn: aComputer 
	^ (aComputer has: #interruptController)
		ifFalse: [aComputer
				interruptController: (self master computer: aComputer)]