private
clustersNeededFor: aNumber
	^(aNumber / self bytesPerCluster) ceiling