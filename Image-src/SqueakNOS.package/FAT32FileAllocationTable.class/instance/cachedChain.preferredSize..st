services
cachedChain: aNumber preferredSize: aPreferredSize
	^(self hasCached: aNumber)
		ifTrue:  [ ^self chainFor: aNumber ]
		ifFalse: [ | chain | 
				 chain := self internalClusterChainFor: aNumber preferredSize: aPreferredSize.
				 self cache: aNumber with: chain.
				 ^chain ]
