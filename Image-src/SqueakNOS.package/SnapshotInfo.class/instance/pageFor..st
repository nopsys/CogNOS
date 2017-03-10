accessing
pageFor: anAddress
	"This method was automatically generated"
	| pages start pageDescriptorAddress virtualAddress |
	pages := OrderedCollection new: self toSave.
	start :=  handle pointerAt: 9.
	0 to: self saved - 1 do: [:index | 
		pageDescriptorAddress := start + (index * ReadonlyPage byteSize).
		virtualAddress := pageDescriptorAddress unsignedLongAt: 1.
		(anAddress between: virtualAddress and: virtualAddress + 4095) ifTrue: 
			[^ReadonlyPage fromHandle: pageDescriptorAddress]
	].
	^nil