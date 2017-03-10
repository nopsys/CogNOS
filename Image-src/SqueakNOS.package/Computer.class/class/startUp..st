class initialization
startUp: resuming 
	self isSqueakNOS
		ifTrue: [
				resuming ifTrue: [
					Transcript cr; show: 'This is SqueakNOS!!! :-)'; cr. 
					self startUpPCComputer
				] ifFalse: [
					snapshotter ifNotNil: [: s | s snapshot. snapshotter := nil] 
				]
		] ifFalse: [
			Transcript cr; show: 'This is not SqueakNOS! :-('; cr.
			FileDirectory startUp.
		]