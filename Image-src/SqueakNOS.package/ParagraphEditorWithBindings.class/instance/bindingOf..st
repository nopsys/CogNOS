as yet unclassified
bindingOf: key
	model ifNil: [model := Dictionary new].
	(model includesKey: key) ifFalse: [model at: key put: nil].
	^ model associationAt: key