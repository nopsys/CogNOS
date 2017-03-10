testing
isMemoryMapValid
	"Modules are valid if six bit of the flags is set"
	^(self flags bitAnd: 16r00000020) = 16r00000020