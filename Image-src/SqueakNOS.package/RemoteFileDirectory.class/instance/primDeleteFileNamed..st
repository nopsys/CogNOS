as yet unclassified
primDeleteFileNamed: aFileName
	^ self channel remotePerform: #primDeleteFileNamed: with: aFileName