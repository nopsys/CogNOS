private
checkCardPresent
	self isCardInserted
		ifTrue: [self report: 'card inserted']
		ifFalse: [self report: 'card removed'].