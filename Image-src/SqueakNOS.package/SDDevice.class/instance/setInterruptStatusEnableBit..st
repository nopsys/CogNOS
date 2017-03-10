private
setInterruptStatusEnableBit: bit
	| register |
	register := self interruptStatusEnableRegister.
	register := register bitOr: (1 bitShift: bit).
	self longAt: 16r34 put: register