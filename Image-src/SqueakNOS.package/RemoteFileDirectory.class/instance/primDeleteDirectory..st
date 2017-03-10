as yet unclassified
primDeleteDirectory: fullPath
	^ self channel remotePerform: #primDeleteDirectory: with: fullPath