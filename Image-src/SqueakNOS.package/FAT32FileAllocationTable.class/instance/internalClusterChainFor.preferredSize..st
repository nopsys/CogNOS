services
internalClusterChainFor: aClusterNumber preferredSize: aPreferredSize
	| chain nextCluster | 
	nextCluster := aClusterNumber.
	chain := OrderedCollection new: aPreferredSize.
	[(nextCluster bitAnd: 16r0FFFFFFF) = 16r0FFFFFFF] whileFalse: [
		chain add: nextCluster.	
		self setPositionTo: nextCluster.
		nextCluster := self nextRecord unsignedLongAt: 1
	].
	^chain