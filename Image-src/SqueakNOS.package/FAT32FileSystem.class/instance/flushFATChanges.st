flushing
flushFATChanges
	"flush to disk each fat index marked as dirty."
	| diskFAT |
	"fatToFlush ifEmpty: [ ^self ]."
	diskFAT := FAT32FileAllocationTable on: 
		(StreamOnStream 
			on: stream copy
			offset: self fatBeginLBA 
			size: self bytesPerFAT).
	fatToFlush do: [ :aClusterNumber | diskFAT point: aClusterNumber to: (fat nextClusterFor: aClusterNumber)].
		
		