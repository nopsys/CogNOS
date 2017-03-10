accessing - addresses map
allIORanges
	| answer addr |

	answer := OrderedCollection new: 6.
	0 to: 5 do: [:i |
		addr := self baseAddressRegister: i.
		addr even
			ifTrue: ["is memory"]
			ifFalse: [
				answer add: 
					(addr bitAnd: 3 bitInvert) -> (self baseIOAddressRegisterSize: i original: addr).
			]].

	^ answer