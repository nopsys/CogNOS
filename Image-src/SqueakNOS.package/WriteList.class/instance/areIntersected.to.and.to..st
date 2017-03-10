as yet unclassified
areIntersected: firstA to: lastA and: firstB to: lastB
	firstA > lastB ifTrue: [^false].
	lastA < firstB ifTrue: [^false].
	^true.