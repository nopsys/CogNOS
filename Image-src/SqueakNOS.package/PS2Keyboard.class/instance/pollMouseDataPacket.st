mouse commands
pollMouseDataPacket
	self mouseCommand: 16rEB.
	^self readMouseDataPacket