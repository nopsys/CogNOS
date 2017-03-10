accessing
enableTransmitInterrupt
	"bit 4 - LTINT
	When LTINTEN is set to ONE this bit functions as LTINT on
	host write operations and on PCnet-PCI II controller read operations.

	LTINT is used to suppress interrupts after successful transmission
	on selected frames. When LTINT is cleared to ZERO and
	ENP (End of Packet) is set to ONE, the PCnet-PCI II controller will not
	set TINT (CSR0, bit 9) after a successful transmission. TINT will
	only be set when the last descriptor of a frame has both LTINT and
	ENP set to ONE. When LTINT is cleared to ZERO, it will only
	cause the suppression of interrupts for successful transmission.
	TINT will always be set if the transmission has an error. The
	LTINTEN overrides the function of TOKINTD (CSR5, bit 15)."
	^ self flagsBitSet: 4