private
setInterruptEnableBit: bit
	| register |
	register := self interruptEnableRegister.
	register := register bitOr: (1 bitShift: bit).
	self longAt: 16r38 put: register