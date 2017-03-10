accessing
excessiveDeferralError
	"Excessive Deferral. Indicates that the transmitter has experienced
	Excessive Deferral on this transmit frame, where Excessive
	Deferral is defined in ISO 8802-3 (IEEE/ANSI 802.3). Excessive
	Deferral will also set the interrupt bit EXDINT (CSR5, bit 7)."
	^ self mcnttdrBit: 13