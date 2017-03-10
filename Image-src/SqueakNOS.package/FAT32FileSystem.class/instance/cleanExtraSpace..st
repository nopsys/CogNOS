services
cleanExtraSpace: id
	| clusters |
	clusters := self clustersNeededFor: id size.
	fat shrinkClusterChainOf: id identifier to: clusters