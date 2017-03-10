services
directoryRecords
	^self records select: [:record | (record isUnused not and: [record isVFat not]) and: [record isDirectory]]