services
defaultHandlingBlock
	^[ :anAddress :handler | | directoryEntry pageEntry |
		self halt.
		directoryEntry := manager pageDirectoryEntryFor: anAddress.
		directoryEntry isPresentAndAllowed ifFalse: [directoryEntry setPresentAndWritable].
		pageEntry := manager pageTableEntryFor: anAddress.
		pageEntry isPresentAndAllowed 
			ifFalse: [pageEntry setPresentAndWritable]
			ifTrue: [self error: 'Why did this page faulted?']
	]
	