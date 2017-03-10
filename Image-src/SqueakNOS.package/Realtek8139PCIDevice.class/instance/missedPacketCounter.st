accessing
missedPacketCounter
	"MPC - Missed Packet Counter: Indicates the number of packets discarded
	due to rx FIFO overflow. It is a 24-bit counter. After s/w reset, MPC is
	cleared. Only the lower 3 bytes are valid. When any value is written,
	MPC will be reset."
	^ self longAt: 16r4C
