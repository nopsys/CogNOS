class initialization
initializeSDCommands
	SDCommands := Dictionary new
		at: 'SendCSD' put: 8;
		at: 'SendCID' put: 10;
		at: 'SendRelativeAddress' put: 3;
		yourself