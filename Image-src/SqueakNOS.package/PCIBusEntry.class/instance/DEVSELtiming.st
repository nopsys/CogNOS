accessing - status
DEVSELtiming
	" bits 9,10 - These bits encode the timing of DEVSEL#. Section 3.6.1. of
	PCI Local Bus Spec specifies three allowable timings for assertion of DEVSEL#.
	These are encoded as 00b for fast, 01b for medium, and 10b for slow (11b is
	reserved). These bits are read-only and must indicate the slowest time
	that a device asserts DEVSEL# for any bus command except
	Configuration Read and Configuration Write."

	^ self status >> 9 bitAnd: 3