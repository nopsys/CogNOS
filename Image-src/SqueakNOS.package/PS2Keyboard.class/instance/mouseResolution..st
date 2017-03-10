mouse commands
mouseResolution: value
	^ (self mouseCommand: 16rE8) and: [self mouseCommand: value]