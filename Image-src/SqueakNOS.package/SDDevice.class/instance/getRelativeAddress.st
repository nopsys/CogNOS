commands
getRelativeAddress
	| answer |
	answer := self sendCommand: 3.
	answer bitShift: -16.
	^answer bitAnd: 16rFFFF