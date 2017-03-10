accessing
timeDomainReflectometer
	"nice method name eh! not my imagination thought :-)
	TDR Time Domain Reflectometer reflects the state of an internal
	PCnet-PCI II controller counter that counts at a 10 MHz rate from the
	start of a transmission to the occurrence of a collision or loss of
	carrier. This value is useful in determining the approximate distance
	to a cable fault. The TDR value is written by the PCnet-PCI II
	controller and is valid only if RTRY is set.
	Note that 10 MHz gives very low resolution and in general has not
	been found to be particularly useful. This feature is here primarily
	to maintain full compatibility with the C-LANCE device (Am79C90)."
	^ self mcnttdr bitAnd: 16r3FF