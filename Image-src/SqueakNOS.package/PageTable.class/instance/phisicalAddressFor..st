translation
phisicalAddressFor: aNumber
	| entry |
	entry := self entryFor: aNumber.
	^entry pointedAddress