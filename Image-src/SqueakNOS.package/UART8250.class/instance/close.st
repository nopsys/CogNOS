device protocol
close
	Preferences disableLogging.
	self interruptEnableRegister: 0.
	self modemControlRegister: 3.

