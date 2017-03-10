keyboard commands
resetKeyboard
	| answer |
	self keyboardCommand: 16rFF.
	self waitKeyboardAck ifFalse: [^false].
	(answer := self readKeyboardData) ifNil: [^ false].
	answer == 16rAA ifTrue: [^true].
	answer ~~ 16rFC ifTrue: [self report: 'Unexpected answer to reset command: ', answer hex].
	^ false