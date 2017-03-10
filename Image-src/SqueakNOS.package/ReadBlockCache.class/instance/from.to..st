as yet unclassified
from: firstBlock to: lastBlock
	 | data |
	"Very primitive caching mechanism"
	(firstBlock = (cache at: 1)) & (lastBlock = (cache at: 2)) ifFalse: [
		data := device from: firstBlock to: lastBlock.
		cache := Array with: firstBlock with: lastBlock with: data.
	] ifTrue: [ data := cache at: 3].

	^data.
	
