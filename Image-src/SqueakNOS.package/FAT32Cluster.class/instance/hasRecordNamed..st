testing
hasRecordNamed: aString
	^self allRecords anySatisfy: [:record | (record name asLowercase = aString asLowercase)].
	