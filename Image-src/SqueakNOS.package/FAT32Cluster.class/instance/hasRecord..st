testing
hasRecord: id
	^self allRecords anySatisfy: [:record | (record firstCluster = id)].
	