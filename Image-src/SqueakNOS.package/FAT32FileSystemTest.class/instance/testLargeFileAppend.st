as yet unclassified
testLargeFileAppend

	self createTempFile: 'morecopy.st' from: 'moreth~2' do:
	[ :original :clone :filesystem | | stream |
	
		stream := clone readWriteStream.
		stream setToEnd.
		stream nextPutAll: 'Goodbye cruel world!'.
		self assert: clone readStream contents withBlanksTrimmed = (original readStream contents withBlanksTrimmed, 'Goodbye cruel world!').
	].
	
	