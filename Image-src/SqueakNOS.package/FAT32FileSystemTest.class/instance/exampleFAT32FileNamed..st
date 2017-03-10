as yet unclassified
exampleFAT32FileNamed: aFileName
	|  filesystem root |
	filesystem := self newInstance.
	root := filesystem root.
	
	^(root fileNamed: (filesystem pureFAT32FilenameFor: aFileName)) readStream .