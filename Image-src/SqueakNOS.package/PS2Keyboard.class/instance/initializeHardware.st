initialization
initializeHardware
	self
		initializeKeyboardHardware;
		initializeMouseHardware.

"	self enableKeyboardInputBufferFullInterrupt;	not needed, commandByte: 16r47 enables all
		enableKeyboardInterface.
"
	self commandByte: 16r47.	" enable mouse and keyboard, and set scan code 1 "
