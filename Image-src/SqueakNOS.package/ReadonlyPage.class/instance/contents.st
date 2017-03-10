accessing
contents
	"This method was automatically generated"
	^(Buffer at: self address + 8 size: 4096) contents
	