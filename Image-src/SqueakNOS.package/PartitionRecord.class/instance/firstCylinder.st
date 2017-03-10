as yet unclassified
firstCylinder
	"01h - Beginning of Partition - Cylinder/Sector - 2 Byte
	"
	^self decodedCylinderLow: (bytes byteAt: 3) high: (bytes byteAt: 4).