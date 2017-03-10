as yet unclassified
testWrite
	| device cache array original |
	device := ATAController primary master.
	cache := BlockCache on: device.
	
	array := ByteArray withAll: (0 to: 255).
	
	original :=  (device at: 1) asByteArray.
	original replaceFrom: 15 to: 32 with: array startingAt: 5.
	cache replaceFromByte: 15 bytesCount: 18 with: array startingAtByte: 5.
	
	self assert: original = (cache from: 1 to: 1).