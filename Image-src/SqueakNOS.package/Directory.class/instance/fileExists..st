quering
fileExists: aString
	^self files anySatisfy: [:file | file name asLowercase = (filesystem nameFormat: aString) asLowercase]