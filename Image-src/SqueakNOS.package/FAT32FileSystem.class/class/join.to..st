services
join: path to: finalName
	^((path = '') ifFalse: [path, FileDirectory slash] ifTrue: ['']), finalName.