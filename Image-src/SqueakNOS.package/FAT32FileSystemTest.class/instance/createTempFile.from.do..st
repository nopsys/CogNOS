as yet unclassified
createTempFile: tempFileName from: existingFileName do: aTriArgsBlock
	| filesystem root original clone |
	filesystem := self newInstance.
	root := filesystem root.

	original := root files detect: [:file | file name asLowercase = existingFileName].
	(root files noneSatisfy: [:file | file name asLowercase = tempFileName]) ifFalse: [self error: 'Temporary file already exists.'].
	
	[
		clone := root newFileNamed: tempFileName.
		clone readWriteStream nextPutAll: original readStream contents withBlanksTrimmed.
		aTriArgsBlock value: original value: clone value: filesystem.
	] ensure: [
		root removeFileNamed: tempFileName.
		(root files noneSatisfy: [:file | file name asLowercase = tempFileName]) ifFalse: [ self error: 'Couldn''t delete temporary file' ].
	]