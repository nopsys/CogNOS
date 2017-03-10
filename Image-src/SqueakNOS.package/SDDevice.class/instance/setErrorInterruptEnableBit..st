private
setErrorInterruptEnableBit: bit
	| register |
	register := self errorInterruptEnableRegister.
	register := register bitOr: (1 bitShift: bit).
	self longAt: 16r3A put: register