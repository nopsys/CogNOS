system startup
installOn: aComputer
	| keyboard |
	keyboard := self onPort: 16r60.
	aComputer interruptController addHandler: keyboard forIRQ: 1.
	aComputer keyboard: keyboard.
	aComputer interruptController addHandler: keyboard forIRQ: 12.
	HandMorph allInstances do: [:each |
		each hasUserInformation ifFalse: [
			each userInitials: ' ' andPicture: each userPicture]].
	Sensor eventTicklerProcess terminate.
	^ aComputer mouse: keyboard.
