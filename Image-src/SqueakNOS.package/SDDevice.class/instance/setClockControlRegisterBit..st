private
setClockControlRegisterBit: bit
	| register |
	register := self clockControlRegister.
	register := register bitOr: (1 bitShift: bit).
	self shortAt: 16r2C put: register