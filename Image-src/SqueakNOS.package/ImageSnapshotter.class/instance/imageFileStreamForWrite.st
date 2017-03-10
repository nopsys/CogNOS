internal
imageFileStreamForWrite
	| filesystem image contents directory name bytearray |
	filesystem := computer primaryFilesystem.
	directory := filesystem root.
	name := Smalltalk imageName.
	image := (directory fileExists: name) ifTrue: [directory fileNamed: name] ifFalse: [directory newFileNamed: name]. 
	^image writeStream