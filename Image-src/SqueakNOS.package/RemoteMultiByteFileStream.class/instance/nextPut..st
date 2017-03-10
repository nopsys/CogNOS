remote file compatibility
nextPut: char
	^ self channel remotePerform: #nextPut: with: char