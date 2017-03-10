sources loading
openSourceFiles
	| filesystem directory source sources changes change |
	Smalltalk imageName = SmalltalkImage lastImageName
		ifFalse: [SmalltalkImage lastImageName: Smalltalk imageName.
				Smalltalk isPharo ifTrue: [ Author fullName: '' ] ifFalse: [ Utilities setAuthorInitials: '' ] ].
	filesystem := self primaryFilesystem.
	sources := filesystem pureFAT32FilenameFor: Smalltalk sourcesName.
	changes := filesystem pureFAT32FilenameFor: Smalltalk changesName.
	directory := filesystem root.
	(directory fileExists: sources)
		ifTrue: [source := (directory readOnlyFileNamed: sources) readStream].
	(directory fileExists: changes)
		ifTrue: [change := (directory readOnlyFileNamed: changes) readWriteStream].
	SourceFiles := Array with: source with: change.
	SourceFileArray install