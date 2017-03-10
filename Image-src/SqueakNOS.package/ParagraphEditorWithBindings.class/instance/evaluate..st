as yet unclassified
evaluate: aString
	paragraph := aString asParagraph.
	self selectAll.
	^ self evaluateSelection