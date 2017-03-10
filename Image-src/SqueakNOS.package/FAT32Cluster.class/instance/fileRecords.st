services
fileRecords
	^self records select: [:record | (record isUnused not and: [record isVFat not]) and: [record isFile]]