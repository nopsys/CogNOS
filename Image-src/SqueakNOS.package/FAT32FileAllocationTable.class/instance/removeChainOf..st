accessing
removeChainOf: id
	| chain |
	chain := self clustersChainFor: id.
	chain do: [:index | self point: index to: 0]