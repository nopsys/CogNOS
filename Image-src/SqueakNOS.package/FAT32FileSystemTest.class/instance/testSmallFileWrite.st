as yet unclassified
testSmallFileWrite
	| filesystem root name small stream |
	filesystem := self newInstance.
	root := filesystem root.
	name := 'small.st'.
	self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] ).
	small := root newFileNamed: name.
	[
		stream := small readWriteStream.
		stream nextPutAll: 'zaraza test small'.
		self assert: (root fileNamed: name) readStream contents = 'zaraza test small'
	] ensure:[
		root removeFileNamed: name.
		self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] )
	]