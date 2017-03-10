private
readFromClusters: clusters startingAt: aNumber count: count
	| index contentsIndex cluster bytes contents qty |
	contents := ByteArray new: count.
	index := aNumber.
	contentsIndex := 1.	
	clusters do: [ :clusterNumber |
			cluster := self clusterNumber: clusterNumber.
			qty := (cluster size min: self bytesPerCluster - index) min: count - contentsIndex + 1. 
			bytes := cluster bytes: qty startingAt: index.
			contents replaceFrom: contentsIndex to: contentsIndex + bytes size - 1 with: bytes.
			index := 0.
			contentsIndex := contentsIndex + bytes size].
	^contents
	
	