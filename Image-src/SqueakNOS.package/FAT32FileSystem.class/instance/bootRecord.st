accessing
bootRecord
	bootRecord isNil ifTrue: [
		stream position: offsetToPartition.
		bootRecord := FAT32BootRecord bytes: (stream next: 512)].
	^bootRecord