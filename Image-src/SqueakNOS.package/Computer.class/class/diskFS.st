filesystem
diskFS
	| device diskStream |
	device := ATAController primary master.
	[ device information ] on: Error do: [ device := ATAController primary slave. device reset ].
	diskStream := CheapHardDiskStream on: device.
	^FAT32FileSystem of: diskStream partition: 1 readOnly: false