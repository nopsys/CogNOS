mouse commands
auxSelfTest
	self controllerCommand: 16rA9.
	^ self waitData = 0