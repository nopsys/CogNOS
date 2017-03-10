accessing
lossOfCarrierError
	"bit 11 - LCAR
	Loss of Carrier is set when the carrier is lost during a PCnet-PCI II
	controller-initiated transmission when in AUI mode and the device
	is operating in half-duplex mode. The PCnet-PCI II controller does
	not retry upon loss of carrier. It will continue to transmit the whole
	frame until done. LCAR will not be set when the device is operating
	in full-duplex mode and the AUI port is active. LCAR is not
	valid in Internal Loopback Mode.
	LCAR is set by the PCnet-PCI II controller and cleared by the host.
	In 10BASE-T mode, LCAR will be set when the T-MAU was in Link
	Fail state during the transmission."
	^ self mcnttdrBit: 11