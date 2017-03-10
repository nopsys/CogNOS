accessing
entriesUptoIndex: stop 
	| entries |
	entries := OrderedCollection new: stop.
	(1 to: stop) do: [:index | entries add: (self entryFor: index)].
	^entries