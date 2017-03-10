accessing
computer: aComputer
	computer := aComputer.
	slave ifNotNil: [slave computer: aComputer]