ports
keyboardCommand: cmd 
	
	[self dataPort: cmd.
	self waitData.
	self ackReceived ifTrue: [^ true].
	self resendReceived] whileTrue.
	^ false