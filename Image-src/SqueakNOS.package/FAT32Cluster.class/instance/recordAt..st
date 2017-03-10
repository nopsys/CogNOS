services
recordAt: index
	| size strm |
	size := self recordSize.
	strm := StreamOnStream on: contents offset: index - 1 * size size: size.
	^FAT32ClusterRecord contents: strm.