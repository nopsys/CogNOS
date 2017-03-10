instance creation
of: aDiskStream partition: aNumber
	"We asume sector size of 512 to make things easier for now."
	aDiskStream binary. "With this we make #next: return ByteArrays and no ByteStrings"
	^(self new stream: aDiskStream; offsetToPartition: 
		((MasterBootRecord of: aDiskStream) offsetToPartition: 1 sectorSize: 512)) initializeFAT.