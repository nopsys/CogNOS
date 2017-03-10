services
allRecords
	| records index |
	index := self firstIndex.
	records := OrderedCollection new.
	[index > self lastIndex] whileFalse: [
			records add: (self recordAt: index).
			index := index + 1.
	].
	^records