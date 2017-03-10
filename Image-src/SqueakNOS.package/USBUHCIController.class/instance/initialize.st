initialization
initialize
	| delay10ms |
	delay10ms := Delay forMilliseconds: 10.
	self enableGlobalReset.
	delay10ms wait.
	self
		disableGlobalReset;
		startHostControllerReset.
	[self hostControllerResetHasFinished] whileFalse: [delay10ms wait].
	self
		disableScheduling;
		disableAllInterrupts;
		disableConfigureFlag;
		initializeFrameList;
		maxPacketSize: 64;
		enableAllInterrupts;
		enableScheduling;
		enableConfigureFlag.
	self initializeRootHubs.