[
	VMMaker generateSqueakNOS64Stack.
	VMMaker generateSqueakNOSPlugins.
]	
on: ProvideAnswerNotification do: [:ex | 
	ex resume: true
].

Smalltalk snapshot: false andQuit: true
