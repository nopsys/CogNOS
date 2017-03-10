class initialization
shutDown: quitting 
	self isSqueakNOS ifTrue: [ 
		snapshotter := (ImageSnapshotter on: self current) prepareToWriteSnapshot.
		Saving := true.
	]