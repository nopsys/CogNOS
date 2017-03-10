accessing
elfSection
	"This method was automatically generated"
	^ElfSectionHeaderTable fromHandle: (handle structAt: 45 length: 16)