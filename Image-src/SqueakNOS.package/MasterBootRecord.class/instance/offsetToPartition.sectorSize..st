as yet unclassified
offsetToPartition: aNumber sectorSize: aSectorSize
	"Gets the partition record number aNumber. There are 4 of them, each occupies 16 bytes and
	 are placed in a table. aNumber can be 1, 2, 3 or 4.
	Result is 0-indexed"

	^(self partitionRecord: aNumber) offsetFromMBR * aSectorSize.