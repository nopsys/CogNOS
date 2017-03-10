accessing
enableCRCGeneration
	"bit 5 - ADD_FCS
	ADD_FCS dynamically controls the generation of FCS on a frame
	by frame basis. It is valid only if the STP (Start of Packet) bit is set.
	When ADD_FCS is set, the state of DXMTFCS is ignored and trans-
	mitter FCS generation is activated. When ADD_FCS is cleared to
	ZERO, FCS generation is controlled by DXMTFCS. When
	APAD_XMT (CSR4, bit 11) is set to ONE, the setting of ADD_FCS
	has no effect. ADD_FCS is set by the host, and is not changed by
	the PCnet-PCI II controller. This is a reserved bit in the C-LANCE
	(Am79C90). This function differs from the corresponding ILACC
	function."
	^ self flagsBitSet: 5

