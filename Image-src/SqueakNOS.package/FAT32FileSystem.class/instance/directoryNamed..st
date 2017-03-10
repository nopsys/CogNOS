services
directoryNamed: aString
	| components current |
	components := aString findTokens: $/.
	components isEmpty ifTrue: [^nil].
	current := self root.
	components do: [ :name |
		current := current directories detect: [:directory | directory name asLowercase = name] ifNone: [^nil].
	].
	^current