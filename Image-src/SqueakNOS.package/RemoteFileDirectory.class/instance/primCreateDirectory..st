as yet unclassified
primCreateDirectory: fullPath
	^ self channel remotePerform: #primCreateDirectory: with: fullPath