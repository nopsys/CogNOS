testing
isPresentAndAllowed:  aNumber
	| entry |
	entry := self entryFor: aNumber.
	^entry isPresentAndAllowed