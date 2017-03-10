accessing - command register
hasVGAPaletteSnoopingEnabled
	"bit 5 - This bit controls how VGA compatible and graphics devices handle
	accesses to VGA palette registers. When this bit is 1, palette
	snooping is enabled (i.e., the device does not respond to palette
	register writes and snoops the data). When the bit is 0, the device
	should treat palette write accesses like all other accesses. VGA
	compatible devices should implement this bit. Refer to Section 3.10.
	of PCI Local Bus Spec for more details on VGA palette snooping."

	^ self testCommandBit: 5