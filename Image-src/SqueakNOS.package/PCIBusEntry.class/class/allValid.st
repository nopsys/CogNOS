instance creation
allValid
	" PCIDevice allValid "
	| answer scanner |
	answer := OrderedCollection new.
	scanner := self bus: 0 device: 0 function: 0.
	0 to: 255 do: [:bus |
		0 to: 31 do: [:device |
			scanner
				bus: bus;
				device: device;
				function: 0.
			scanner isValid ifTrue: [
				answer add: scanner copy.
				scanner isMultiFunction ifTrue: [
					1 to: 7 do: [:function | 
						scanner function: function.
						scanner isValid ifTrue: [answer add: scanner copy]
						]
					]
			]
		]
	].
	^ answer