system startup
installOn: aComputer
	| keyboard p |
	keyboard := self onPort: 16r60.
	aComputer interruptController addHandler: keyboard forIRQ: 1.
	aComputer keyboard: keyboard.
	aComputer interruptController addHandler: keyboard forIRQ: 12.
	HandMorph allInstances do: [:each |
		each hasUserInformation ifFalse: [
			each userInitials: ' ' andPicture: each userPicture.
		]
	].
	self fixPasteUpMorphIfPharo.
	"Cursor normal show."
	SmalltalkImage current isPharo ifFalse: [
		p := Sensor eventTicklerProcess.
		p notNil ifTrue: [p terminate].
	].
	

	^ aComputer mouse: keyboard.
