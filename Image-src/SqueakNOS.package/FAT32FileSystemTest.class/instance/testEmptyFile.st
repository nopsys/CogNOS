as yet unclassified
testEmptyFile
	| filesystem root files empty |
	filesystem := self newInstance.
	root := filesystem root.
	files := root files.
	empty := files detect: [:file | file name asLowercase = 'empty.txt'] ifNone: [self assert: false].
	self assert: empty readStream contents isEmpty.