as yet unclassified
firstSector
	"01h - Beginning of Partition - Cylinder/Sector - 2 Byte"
	^self decodedSector: (bytes byteAt: 3).