services
firstFreeRecordIndex
	self allRecords withIndexDo: [:record :index | (record isUnused or: [record isEndOfDirectory]) ifTrue: [^index]].
	self error: 'aaaa'