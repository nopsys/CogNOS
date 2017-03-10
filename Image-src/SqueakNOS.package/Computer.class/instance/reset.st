initialize-release
reset
	self keyboard controllerCommand: 16rF0.
	self keyboard controllerCommand: 16rD1; dataPort: 0.