filesystem
primaryFilesystem
	^self isSqueakNOS
				ifTrue: [self diskFS]
				ifFalse: [self fileFS].
