as yet unclassified
partitionType
	"04h - Type of Partition - 1 Byte	"
		
	^self class partitionTypes at: (bytes byteAt: 5) ifAbsent: [ ^#unknown].