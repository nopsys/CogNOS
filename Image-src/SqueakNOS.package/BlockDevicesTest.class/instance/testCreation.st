as yet unclassified
testCreation
	self shouldnt: [ATAController primary master] raise: Error.
	self shouldnt: [ATAController secondary slave] raise: Error.
