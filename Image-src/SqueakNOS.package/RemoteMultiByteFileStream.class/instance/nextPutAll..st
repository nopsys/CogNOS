remote file compatibility
nextPutAll: aString
	^ self channel remotePerform: #nextPutAll: with: aString