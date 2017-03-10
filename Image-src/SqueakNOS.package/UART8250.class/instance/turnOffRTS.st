accessing
turnOffRTS
	| mcr |
	mcr := self modemControlRegister.
	self modemControlRegister: (mcr bitAnd: 2r11111101)
