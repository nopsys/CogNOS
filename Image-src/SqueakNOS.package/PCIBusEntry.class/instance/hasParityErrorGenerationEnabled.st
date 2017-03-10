accessing - command register
hasParityErrorGenerationEnabled
	"bit 6 - This bit controls the device\u2019s response to parity errors. When the bit is
	set, the device must take its normal action when a parity error is
	detected. When the bit is 0, the device sets its Detected Parity Error
	status bit (bit 15 in the Status register) when an error is detected, but
	does not assert PERR# and continues normal operation. This bit\u2019s
	state after RST# is 0. Devices that check parity must implement this
	bit. Devices are still required to generate parity even if parity checking
	is disabled."

	^ self testCommandBit: 6