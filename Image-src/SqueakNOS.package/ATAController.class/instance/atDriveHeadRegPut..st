registers
atDriveHeadRegPut: aValue
	"Drive/Head head register, Offset 6, 8 bits.
	 This register contains the drive and head numbers. The contents of this
	 register define the number of heads minus 1, when executing an Initialize
	 Drive Parameters command.
	
	 Upon command completion this register is updated to refplect the head number currently
	 selected.
	"
	^ self byteAt: 6 put: aValue.
	
	"
	+-----------------------------------------+
	| 7 | 6  | 5 |  4   |   3  |   2  |  1  |  0  |
	|---+---+---+-----+-----+-----+-----+-----|
	| 1 | L | 1 | DRV | HS3 | HS2 | HS1 | HS0 |
	+-----------------------------------------+

	- L is the binary encoded address mode select. When L=0, addressing is
	by CHS mode. When L=1, addressing is by LBA mode.
	- DRV is the binary encoded drive select number. When DRV-0, Drive 0 is
	selected. When DRV=1, Drive 1 is selected.
	- If L=0, HS3 through HS0 contain the binary coded address of the head to
	be selected e.g., if HS3 through HS0 are 0011b, respectively, head 3
	will be selected. HS3 is the most significant bit. At command
	completion, these bits are updated to reflect the currently selected
	head.
	- If L=1, HS3 through HS0 contain bits 24-27 of the LBA. At command
	completion, these bits are updated to reflect the current LBA bits
	24-27.
	"
	