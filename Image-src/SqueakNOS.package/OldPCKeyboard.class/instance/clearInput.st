controller commands
clearInput
	100 timesRepeat: [self readData ifNil: [^ self]]