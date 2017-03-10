class initialization
tweakSqueakForSqueakNOS.
	Smalltalk removeFromStartUpList: SecurityManager; removeFromStartUpList: FileDirectory.
	Smalltalk removeFromShutDownList: FileDirectory.
	Debugger logDebuggerStackToFile: false