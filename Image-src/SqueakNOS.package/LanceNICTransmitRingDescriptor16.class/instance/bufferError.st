accessing
bufferError
	"bit 15 - BUFF
	Buffer error is set by the PCnet-PCI II controller during transmission
	when the PCnet-PCI II controller does not find the ENP flag in the
	current descriptor and does not own the next descriptor.
	This can occur in either of two ways:
        1.    The OWN bit of the next descriptor is ZERO.
        2.    FIFO underflow occurred before the PCnet-PCI II
              controller obtained the STATUS byte (TMD1[31:24]) of
              the next descriptor. BUFF is set by the PCnet-PCI II
			controller and cleared by the host.                     

	If a Buffer Error occurs, an Underflow Error will also occur.
	BUFF is not valid when LCOL or RTRY error is set during transmit
	data chaining. BUFF is set by the PCnet-PCI II controller and
	cleared by the host."
	^ self mcnttdrBit: 15