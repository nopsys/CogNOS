remote file compatibility
truncate: pos
	^ self channel remotePerform: #truncate: with: pos