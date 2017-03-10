services
readOnlyFrom: start to: end
	| interval |
	interval := start to: end.
	self pageTables select: [:pageTable | interval rangeIncludes: pageTable ] thenDo: [:pageTable | pageTable readOnly]