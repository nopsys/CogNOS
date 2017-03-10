accessing
pageTableAtIndex: aNumber
	| entry |
	entry := self entryFor: aNumber.
	^entry isPresentAndAllowed ifTrue: [ | alien |
		alien := Alien forPointer: entry pointedAddress. 
		PageTable handledBy: alien entriesCount: self entriesCount entrySize: self entrySize. 
	] ifFalse: [(self error: 'PageFault')]