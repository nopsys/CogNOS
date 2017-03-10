services
records
	^self allRecords reject: [:record | record isUnused or: [record isEndOfDirectory]]