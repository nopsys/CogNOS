accessing - bus control
is16
	^ (self softwareStyleRegister bitAnd: 16rF) isZero