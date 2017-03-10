private
add: aFAT32ClusterRecord at: anIndex
	contents position: self recordSize * (anIndex - 1).
	contents nextPutAll: aFAT32ClusterRecord contents asByteArray