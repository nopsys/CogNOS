testing
isPresentAndAllowed: anAddress
	|  table tableIndex |
	table := self pageTableFor: anAddress.
	tableIndex := self pageTableIndexFor: anAddress.
	^table isPresentAndAllowed: tableIndex