private
adjacentClustersListFrom: clusters do: aBlock
	| clusterStartNumber numberOfClusters |
	clusters size = 0 ifTrue: [^self].
	clusterStartNumber := clusters first.
	numberOfClusters := 1.
	2 to: clusters size do: [ :i | | cluster |
		cluster := clusters at: i.	
		(clusterStartNumber + numberOfClusters = cluster) 
			ifTrue: [ numberOfClusters := numberOfClusters + 1]
			ifFalse: [ aBlock value: clusterStartNumber value: numberOfClusters. 
					numberOfClusters := 1. 
					clusterStartNumber := cluster]
	].
	aBlock value: clusterStartNumber value: numberOfClusters.
	