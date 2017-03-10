as yet unclassified
testLargeFileRead
	"I open a file bigger than one cluster and check it's content to match what is written by the testing filesystem generator script" 

	| bytesPerCluster large contents |
	bytesPerCluster := self newInstance bytesPerCluster.
	
	large := self exampleFAT32FileNamed: 'moreth~2'.
	contents := large readStream contents asString withBlanksTrimmed.
	
	self assert: contents size > bytesPerCluster;
		assert: (contents first: 13) = '1234567890abc';
		assert: (contents last: 13) = '1234567890abc'.