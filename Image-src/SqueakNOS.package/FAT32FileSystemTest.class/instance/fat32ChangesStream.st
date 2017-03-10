as yet unclassified
fat32ChangesStream
	|  filesystem root |
	filesystem := self newInstance.
	root := filesystem root.
	
	^(root readOnlyFileNamed: (filesystem pureFAT32FilenameFor: 'SqueakNOS.changes')) readStream .