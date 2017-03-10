as yet unclassified
testLargeFileWrite
"	| filesystem root name small stream large files contents |
	filesystem := self newInstance.
	root := filesystem root.
	files := root files.
	large := files detect: [:file | file name asLowercase = 'moreth~2'] ifNone: [self assert: false].
	contents := large readStream contents withBlanksTrimmed.
	name := 'large.st'.
	self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] ).
	small := root newFileNamed: name.
	[
		stream := small readWriteStream.
		stream nextPutAll: contents.
		contents := (root fileNamed: name) readStream contents.
		self assert: contents size > filesystem bytesPerCluster;
		assert: (contents first: 13) = '1234567890abc';
		assert: (contents last: 13) = '1234567890abc'.
	] ensure:[
		root removeFileNamed: name.
		self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] )
	]"