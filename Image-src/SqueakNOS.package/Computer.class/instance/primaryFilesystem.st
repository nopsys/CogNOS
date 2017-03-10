filesystem
primaryFilesystem
	^primaryFilesystem ifNil: [ 
		primaryFilesystem := self isSqueakNOS ifTrue: [self class diskFS] ifFalse: [self class fileFS]
	 ]