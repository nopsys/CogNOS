filesystem
blankBlockDeviceForTest
	^self isSqueakNOS
				ifTrue: [ self blankDiskOnRealDiskForTest ]
				ifFalse: [self blankDiskOnFileForTest ].