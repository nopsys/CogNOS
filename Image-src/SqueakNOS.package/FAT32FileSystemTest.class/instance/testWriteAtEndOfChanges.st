as yet unclassified
testWriteAtEndOfChanges
	| filesystem root stream changes files contents readOnlyStream |
	filesystem := self newInstance.
	root := filesystem root.
	files := root files.
	changes := files detect: [:file | file name asLowercase = 'squeak~1.cha'].

	stream := changes readWriteStream.
	stream position: stream size.
	stream nextPutAll: 'Test content'.

	readOnlyStream := changes readStream.
	readOnlyStream position: readOnlyStream size - 12.
	contents := readOnlyStream next: 12.


		self assert: contents = 'Test content'.
	" ensure: [
		root removeFileNamed: name.
		self assert: ( root files noneSatisfy: [:file | file name asLowercase = name] )
	]"