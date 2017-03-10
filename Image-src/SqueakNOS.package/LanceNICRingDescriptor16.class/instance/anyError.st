accessing - no auto
anyError
	"ERR is the OR of FRAM, OFLO, CRC, BUFF or BPE. ERR is set
	by the PCnet-PCI II controller and cleared by the host."

	^ self flagsBit: 6