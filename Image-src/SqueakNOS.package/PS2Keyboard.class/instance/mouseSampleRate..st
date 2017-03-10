mouse commands
mouseSampleRate: value
	^ (self mouseCommand: 16rF3) and: [self mouseCommand: value]