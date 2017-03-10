mouse commands
resetMouse
	| answer |
	(self mouseCommand: 16rFF) ifFalse: [^false].
	answer := self readMouseData.
	answer == 16rAA ifTrue: [^self readMouseData == 0 " mouse sends device ID after reset "].
	answer ~~ 16rFC ifTrue: [self report: 'Unexpected answer to reset command: ', answer hex].
	^ false