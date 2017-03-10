private
pageTables
	| records tables size entries |
	tables := OrderedCollection new: self entriesCount.
	1 to: self entriesCount do: [:index | tables add: (self pageTableAtIndex: index - 1)].
	^tables