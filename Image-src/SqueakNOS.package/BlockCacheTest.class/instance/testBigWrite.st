as yet unclassified
testBigWrite
	| device cache array original |
	device := Computer blankBlockDeviceForTest.
	cache := BlockCache on: device.
	
	device at: 1 writeArray: (ByteArray new: 300000).
	array := ByteArray new: 200000.
	1 to: 200000 do: [ :i | array at: i put: i \\ 256 ].
	original :=  (device from: 2 to: 300000) asByteArray.

	original replaceFrom:         15                                              to: 200009 with: array startingAt: 5.
	cache   replaceFromByte: (15 + cache blockSize) bytesCount: 199995 with: array startingAtByte: 5.
	
	self assert: original = (cache from: 2 to: 300000).
	