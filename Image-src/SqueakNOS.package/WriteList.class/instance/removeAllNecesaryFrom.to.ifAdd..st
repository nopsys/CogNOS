as yet unclassified
removeAllNecesaryFrom: startPosition to: endPosition ifAdd: aBlock
	| left right newStartPosition newEndPosition |
	left := self findLeftStart: startPosition end: endPosition.
	
	(left at: 2) ifFalse: [
			aBlock value: (left at: 1) value: startPosition value: endPosition.
	] ifTrue: [
		newStartPosition := startPosition min: ((blocksList at: (left at: 1)) at: 1).
	
		right := self findRightStart: startPosition end: endPosition.
		newEndPosition := endPosition max: ((blocksList at: right) at: 2).

		"(((left at: 1) == right) and: [(newStartPosition <= startPosition and: [ newEndPosition >= endPosition ])]) ifFalse: ["
			right to: (left at: 1) by: -1 do: [ :index | blocksList removeAt: index ].
			aBlock value: (left at: 1) value: newStartPosition value: newEndPosition.
		"]"
	] 


	