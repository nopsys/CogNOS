as yet unclassified
findLeftStart: startPosition end: endPosition
	
	blocksList withIndexDo: [ :elem :index |
		((elem at: 2) >= startPosition) ifTrue: [
			((elem at: 1) <= endPosition) ifTrue: [^{index. true}] ifFalse: [^{index. false}].
		].
	].
	^{blocksList size + 1. false}.

