accessing - command register
hasFastBackToBackEnabled
	"bit 9 - This optional read/write bit controls whether or not a master can do
	fast back-to-back transactions to different devices. Initialization
	software will set the bit if all targets are fast back-to-back capable. A
	value of 1 means the master is allowed to generate fast back-to-back
	transactions to different agents as described in Section 3.4.2. A value
	of 0 means fast back-to-back transactions are only allowed to the
	same agent. This bit\u2019s state after RST# is 0."

	^ self testCommandBit: 9