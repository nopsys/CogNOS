as yet unclassified
partitionRecord: aNumber
	"Gets the partition record number aNumber. There are 4 of them, each occupies 16 bytes and
	 are placed in a table. aNumber can be 1, 2, 3 or 4"

	| offset |
	offset := 447 + (16 * (aNumber - 1)).
	^PartitionRecord with: (bytes copyFrom: offset to: offset+15).