commands
getCardID
	| answer address arg |
	address := self getRelativeAddress.
	arg := address bitShift: 16.
	answer := self sendCommand: 10 with: arg.
	^answer bitAnd: 16rFFFF
	
SDCommands