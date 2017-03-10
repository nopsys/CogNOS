accessing
notPresent
	| value |
	value := handle unsignedLongAt: 1.
	value := value bitAt: 1 put: 0.
	handle unsignedLongAt: 1 put: value 