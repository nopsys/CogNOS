private
addFirstClusterTo: aFilesystemContent
	| index cluster |
	index := self addClusterTo: aFilesystemContent.
	aFilesystemContent identifier: index.
	cluster := self clusterForFileNamed: aFilesystemContent name onDirectory: aFilesystemContent directory.
	cluster addFirstClusterToFileNamed: aFilesystemContent name cluster: index
	