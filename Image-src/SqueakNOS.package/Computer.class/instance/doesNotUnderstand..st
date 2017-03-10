accessing
doesNotUnderstand: aMessage
	| selector |
	"it would be nice to compile the accessor the first time it's used"
	selector := aMessage selector.
	(aMessage arguments size = 1 and: [selector last = $:])
		ifTrue: [
			^ self add: aMessage arguments first
				named: selector allButLast asSymbol].

	^ devices at: aMessage selector ifAbsent: [
		super doesNotUnderstand: aMessage]
