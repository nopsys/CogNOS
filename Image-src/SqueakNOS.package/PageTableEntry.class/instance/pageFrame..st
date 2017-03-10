accessing
pageFrame: aNumber
	| value frame |
	"aNumber must be page aligned"
	value := handle unsignedLongAt: 1.
	value := value bitAnd: 16r00000FFF.
	value := value bitOr: aNumber.
	handle unsignedLongAt: 1 put: value