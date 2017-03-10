testing
hasFreeRecords
	| records |
	records := self allRecords.
	^(records anySatisfy: [:record | record isUnused]) or: [records anySatisfy: [:record | record isEndOfDirectory]].