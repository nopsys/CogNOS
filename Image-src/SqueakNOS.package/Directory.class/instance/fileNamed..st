services
fileNamed: aString
	^self files detect: [:file | file name asLowercase = (filesystem nameFormat: aString) asLowercase] 