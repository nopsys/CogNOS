commands
command
	"This register is used for issuing commands to the RTL8139C(L).
	These commands are issued by setting the corresponding bits for
	the function. A global software reset along with individual reset
	and enable/disable for transmitter and receiver are provided here."
	^ self byteAt: 16r37