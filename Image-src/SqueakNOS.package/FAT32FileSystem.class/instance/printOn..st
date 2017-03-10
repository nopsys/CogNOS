accessing
printOn: out
	"Answer the value of stream"

	out nextPutAll: 'FAT32FileSystem'; cr;
		nextPutAll: 'Offset to Partition: ', offsetToPartition; cr;
		nextPutAll: 'Begin of FAT: ', self fatBeginLBA; cr;
		nextPutAll: 'Begin of data clusters: ', self clusterBeginLBA; cr; cr;
		nextPutAll: bootRecord printString; cr; cr;
		nextPutAll: self root printString.
	 