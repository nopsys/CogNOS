as yet unclassified
decodedCylinderLow: encodedCylSecLow high: encodedCylSecHigh
	"
	+ 15 14 13 12 11 10 9 8	|    7    6  	| 5 4 3 2 1 0	+
	|  Cylinder Bits 7 to 0	|  Cylinder	|   Sector 	|
	+ 						|   Bits 9+8	| Bits 5 to 0	+
	"
	^encodedCylSecHigh bitOr: ((encodedCylSecLow bitAnd: 16rC0) bitShift: 2).