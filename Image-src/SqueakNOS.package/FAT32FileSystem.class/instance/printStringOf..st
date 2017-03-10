accessing
printStringOf: aDirectory
	| cluster clusters out |

	out := ReadWriteStream on: ''.
	clusters := self clustersChainFor: aDirectory.
	clusters do: [ :aNumber |
		cluster := self clusterNumber: aNumber.
		cluster fileRecords do: [ :record |
			out nextPutAll: 'File: ', record name;
				nextPutAll: ', first cluster: ', record firstCluster;
				nextPutAll: ', size: ', record size; nextPut: Character cr ].
	].
	 
	^out contents.