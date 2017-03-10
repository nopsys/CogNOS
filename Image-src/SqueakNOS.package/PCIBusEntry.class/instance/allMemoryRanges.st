accessing - addresses map
allMemoryRanges
	| answer addr |

	answer := OrderedCollection new: 6.
	0 to: 5 do: [:i |
		addr := self baseAddressRegister: i.
		(addr ~= 0 and: [addr even])
			ifTrue: ["is memory"
				answer add: 
					(addr bitAnd: 3 bitInvert) -> (self baseMemoryAddressRegisterSize: i original: addr).
			]].

	^ answer