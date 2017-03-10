services
clustersChainFor: aNumber preferredSize: aPreferredSize
	^(self cachedChain: aNumber preferredSize: aPreferredSize) copy.
