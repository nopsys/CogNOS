private
groupsOf: n atATimeIn: aByteArray do: aBlock 
	"Evaluate aBlock with my elements taken n at a time. Ignore any leftovers at the end. Taken from SequenceableCollection but highly optimized."
	| args |
	args := ByteArray new: n.
	n to: aByteArray size by: n do: [:index |
		args replaceFrom: 1
			 to: n
			 with: aByteArray
			 startingAt: index - n + 1.
		aBlock value: args.
	]
