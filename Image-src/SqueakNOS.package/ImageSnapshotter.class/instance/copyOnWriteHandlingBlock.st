handling strategies
copyOnWriteHandlingBlock
	^[ :anAddress :handler |	| directoryEntry pageEntry table newTable contents start manager |
		manager := computer memoryManager.
		directoryEntry := manager pageDirectoryEntryFor: anAddress.
		directoryEntry isPresentAndAllowed ifFalse: [self error: 'Que fachemo si viene el fault en el directory?'].
		pageEntry := manager pageTableEntryFor: anAddress.
		pageEntry isPresentAndForbidden ifFalse: [pageEntry isPresent ifTrue: [self] ifFalse: [ handler doDefaultHandlingFor: anAddress ]]
			ifTrue:[
				contents := self pageContentsOf: anAddress.
				start := manager pageStartAddressOf: anAddress.
				savedPages at: start put: contents. 
				pageEntry setPresentAndWritable
		]
	]
	