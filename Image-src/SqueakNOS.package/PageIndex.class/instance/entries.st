accessing
entries
	| count entries |
	count := self entriesCount.
	entries := OrderedCollection new: count.
	0 to: count - 1 do: [:index | | record | 
			entries add: (self entryFor: index)].
	^entries