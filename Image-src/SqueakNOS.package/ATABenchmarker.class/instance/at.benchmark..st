services
at: aTitle benchmark: aBlock
	| startTime |
	startTime := Time millisecondsToRun: aBlock.
	results at: aTitle put: startTime.
	
