private
setInterruptStatusBit: bit
	| register |
	register := self interruptStatus.
	register := register bitOr: (1 bitShift: bit).
	self longAt: 16r30 put: register