commands
waitForCommandSendAllowed
	self waitFor: [self canIssueCommand]