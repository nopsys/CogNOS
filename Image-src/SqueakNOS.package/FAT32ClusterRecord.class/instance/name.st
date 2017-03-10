accessing
name
	| name extension |
	contents position: 0.
	name := (contents next: 8) asString withBlanksTrimmed.
	extension := (contents next: 3) asString withBlanksTrimmed.
	extension notEmpty ifTrue: [extension := '.' , extension].
	^name , extension