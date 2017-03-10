as yet unclassified
primLookupEntryIn: fullPath index: index
	^ self channel remotePerform: #primLookupEntryIn:index: with: fullPath with: index