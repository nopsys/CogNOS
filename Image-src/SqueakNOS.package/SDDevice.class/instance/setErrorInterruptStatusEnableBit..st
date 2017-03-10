private
setErrorInterruptStatusEnableBit: bit
	| register |
	register := self errorInterruptStatusEnableRegister.
	register := register bitOr: (1 bitShift: bit).
	self longAt: 16r36 put: register