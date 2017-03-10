as yet unclassified
testRead
	| device cache |
	device := ATAController primary master.
	cache := BlockCache on: device.
	
	
	self assert: (device from: 10 to: 11) asByteArray = (cache from: 10 to: 11).	
	self assert: (device from: 1 to: 1) asByteArray = (cache from: 1 to: 1).
	self assert: (device from: 100 to: 110) asByteArray = (cache from: 100 to: 110).