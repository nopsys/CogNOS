services
updateSizeOf: aFile with: aNumber
 	| cluster |
	self truncateClusterChainOf: aFile newSize: aNumber.
	cluster := self clusterForFile: aFile onDirectory: aFile directory.
	cluster updateSizeOfFileNamed: aFile name with: aNumber.
	aFile size: aNumber