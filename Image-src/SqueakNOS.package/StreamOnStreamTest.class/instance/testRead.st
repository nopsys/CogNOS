as yet unclassified
testRead
	| source |
	source := ReadStream on: 'this is a long string to read'.
	self assert: (StreamOnStream on: source offset: 5) contents asString = 'is a long string to read'.
	self assert: (StreamOnStream on: source offset: 5 size: 9) contents asString = 'is a long'.