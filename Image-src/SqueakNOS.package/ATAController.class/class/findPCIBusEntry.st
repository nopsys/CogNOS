as yet unclassified
findPCIBusEntry
	
	"IDE controller have a PCI classID = 1 (Mass storage device) and subclass 1 (IDE Mass storage device)."
	
	^PCIBusEntry allValid detect: [ :entry | entry classCode = 1 and: [entry classSubCode = 1]] ifNone: [^nil].