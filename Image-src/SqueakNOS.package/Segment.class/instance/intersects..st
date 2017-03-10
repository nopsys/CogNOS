as yet unclassified
intersects: anotherSegment
	start > anotherSegment stop ifTrue: [^false].
	stop < anotherSegment start ifTrue: [^false].
	^true.