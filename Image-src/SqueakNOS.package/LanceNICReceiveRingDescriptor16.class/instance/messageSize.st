accessing
messageSize
	"Message Byte Count is the length in bytes of the received
	message, expressed as an unsigned binary integer. MCNT is
	valid only when ERR is clear and ENP is set. MCNT is written by
	the PCnet-PCI II controller and cleared by the host."
	^ self mcnttdr - 4