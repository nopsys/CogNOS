accesing
pageTableEntriesFor: anInterval
	|  startDirectoryIndex stopDirectoryIndex start end firstIndex lastIndex entries |
	start := anInterval first.
	end := anInterval last.
	startDirectoryIndex := self pageDirectoryIndexFor: start.
	stopDirectoryIndex := self pageDirectoryIndexFor: end.
	entries := OrderedCollection new.
	firstIndex := self pageTableIndexFor: start.
	lastIndex := self pageTableIndexFor: end.
	startDirectoryIndex = stopDirectoryIndex ifTrue: [
		entries addAll: ((directory pageTableAtIndex: startDirectoryIndex) entriesFromIndex: firstIndex to: lastIndex).
	] ifFalse: [
		entries addAll: ((directory pageTableAtIndex: startDirectoryIndex) entriesFromIndex: firstIndex);
				addAll: ((directory pageTableAtIndex: stopDirectoryIndex) entriesUptoIndex: lastIndex).		
		startDirectoryIndex + 1 to: stopDirectoryIndex - 1 do: [:index |
			entries addAll: (directory pageTableAtIndex: index) entries
		]
	].
	^entries
	
	