accessing - status
hasMasterDataParityError
	" bit 8 - This bit is only implemented by bus masters. It is set when three
	conditions are met: 1) the bus agent asserted PERR# itself (on a read)
	or observed PERR# asserted (on a write); 2) the agent setting the bit
	acted as the bus master for the operation in which the error occurred;
	and 3) the Parity Error Response bit (Command register) is set."

	^ self statusBit: 8