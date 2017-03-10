private
groupsOfMax: n atATimeIn: aByteArray do: aBlock
	"Evaluate aBlock with my elements taken n at a time. Also evaluate with leftover elements at end"
	| leftover |
	leftover := aByteArray size \\ n.
	n
		to: aByteArray size
		by: n
		do: [:index | 
			| args |
			args := (aByteArray copyFrom: index - n + 1 to: index).
			aBlock value: args
		].
	
	(leftover > 0) ifTrue: [
		aBlock value: (aByteArray copyFrom: aByteArray size - leftover + 1 to: aByteArray size)
	].

