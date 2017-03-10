as yet unclassified
testImageSaving
	| image collection raw tester cache bytes strm1 strm2 sizeToTest |
	image := StandardFileStream fileNamed: SmalltalkImage current imageName.
	sizeToTest := 1000000.
	bytes := (image next: sizeToTest) asByteArray.
	collection := OrderedCollection new: sizeToTest.
	strm1 := ReadWriteStream on: collection.
	strm2 := ReadWriteStream on: collection copy.
	cache := BlockDeviceOnStream on: strm1 blockSize: 512.
	cache enableCache.
	raw := BlockDeviceOnStream on: strm2 blockSize: 512.
	tester := DualTestBlockDevice deviceA: cache deviceB: raw.
	tester at: 1 writeArray: bytes; flush.
	self assert: (tester fromByte: 1 bytesCount: bytes size) asByteArray = bytes.
	image close
	