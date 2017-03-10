transmiting
transmitStatus: index
	"The read-only bits (CRS, TABT, OWC, CDH, NCC3-0, TOK, TUN) will be cleared
	by the RTL8139C(L) when the Transmit Byte Count (bit12-0) in the corresponding
	Tx descriptor is written. It is not affected when software writes to these bits.
	These registers are only permitted to write by double-word access. After a software
	reset, all bits except the OWN bit are reset to 0"
	^ self longAt: index*4+16r10