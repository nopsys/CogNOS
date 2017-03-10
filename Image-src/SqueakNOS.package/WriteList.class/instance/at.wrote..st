as yet unclassified
at: aPosition wrote: someData
	self reserve: someData size at: aPosition.
	writeQueue add: { aPosition. someData }