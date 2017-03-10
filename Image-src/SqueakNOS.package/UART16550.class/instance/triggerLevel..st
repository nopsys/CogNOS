FIFO control
triggerLevel: integer
	| idx |
	idx := #(1 4 8 14) indexOf: integer.
	idx = 0 ifTrue: [idx := 3]. "default value"
	fifoStatus := fifoStatus bitOr: ((idx - 1) bitShift: 6).
	self fifoControlRegister:	fifoStatus