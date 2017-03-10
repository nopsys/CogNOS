instance creation
installOn: aComputer
	| card |
	card := super installOn: aComputer.
	card ifNil: [^ nil].
	card enableInterrupts.
	aComputer sdCard: card.
	^card