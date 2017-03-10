private
clustersChainFor: aFileSystemContent
	| clusters count |
	count := aFileSystemContent isFile ifTrue: [
		(aFileSystemContent size / self bytesPerCluster) ceiling.
	] ifFalse: [0].
	^fat clustersChainFor: aFileSystemContent identifier preferredSize: count.
