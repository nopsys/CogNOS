accessing
readOnly 
	| value |
	"User mode needs to be set"
	value := handle unsignedLongAt: 1.
	value := value bitAt: 2 put: 0.
	handle unsignedLongAt: 1 put: value	
	


