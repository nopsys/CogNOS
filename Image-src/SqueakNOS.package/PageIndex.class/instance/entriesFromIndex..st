accessing
entriesFromIndex: start 
	| entries stop |
	stop := self entriesCount.
	entries := OrderedCollection new: stop - start + 1.
	(start to: stop) do: [:index | entries add: (self entryFor: index)].
	^entries