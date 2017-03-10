as yet unclassified
correspondingMapWith: aModifiersRegister

	"rule 1 - extended keys aren't affected by modifiers like control and alt gr.
	 rule 2 - caps lock isn't handled here, because <fill when you know the answer>"
	
	| modifiers |
	modifiers := OrderedCollection new.
	
	previousScanCode == 16rE0 ifTrue: [ modifiers add: #extended. ^modifiers asArray. ].
	
	(self shiftPressedIn: aModifiersRegister) ifTrue: [ modifiers add: #shift ].
	(self altGrPressedIn: aModifiersRegister) ifTrue: [ modifiers add: #alt ].

	modifiers ifEmpty: [modifiers add: #none].
	
	 ^modifiers asArray.