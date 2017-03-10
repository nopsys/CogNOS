as yet unclassified
testNewAndRemoveFile
	| filesystem root test name |
	filesystem := self newInstance.
	root := filesystem root.
	name := 'test.st'.
	self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] ).
	root newFileNamed: name.
	[
		test := root files detect: [:file | file name asLowercase = name] ifNone: [self assert: false].
		self assert: test readStream contents isEmpty
	] ensure:[
		root removeFileNamed: name.
		self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] )
	]