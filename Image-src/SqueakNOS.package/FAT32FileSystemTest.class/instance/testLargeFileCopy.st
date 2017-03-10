as yet unclassified
testLargeFileCopy
	
	self createTempFile: 'morecopy.st' from: 'moreth~2' do:
	[ :original :clone :filesystem | | stream |	
		self assert: original readStream contents withBlanksTrimmed = clone readStream contents withBlanksTrimmed.
	].
	
