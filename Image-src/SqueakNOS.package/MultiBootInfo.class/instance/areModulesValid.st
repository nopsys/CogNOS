testing
areModulesValid
	"Modules are valid if third bit of the flags is set"
	^(self flags bitAnd: 16r00000004) = 16r00000004