mouse commands
readMouseStatus
	self mouseCommand: 16rE9.
	^self readMouseData