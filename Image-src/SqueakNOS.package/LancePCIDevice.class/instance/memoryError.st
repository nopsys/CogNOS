accessing - status
memoryError
	"bit 11 - MERR
	Memory Error is set by the PCnet-PCI II controller when it re-
	quests the use of the system interface bus by asserting REQ
	and GNT has not been asserted after a programmable length of
	time. The length of time in microseconds before MERR is asserted
	will depend upon the setting of the Bus Timeout register
	(CSR100). The default setting of CSR100 will set MERR after
	153.6 ¨µs of bus latency.
	When MERR is set, INTA is asserted if IENA is ONE and the
	mask bit MERRM (CSR3, bit 11) is ZERO. MERR assertion will set
	the ERR bit, regardless of the settings of IENA and MERRM.
	Read/Write accessible always. MERR is cleared by the host by
	writing a ONE. Writing a ZERO has no effect. MERR is cleared
	by H_RESET, S_RESET or by setting the STOP bit."

	^ self statusBit: 11