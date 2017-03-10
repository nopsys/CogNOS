as yet unclassified
forgetOnServer: aHandle
	" called of client side "
	(self channels at: 0)
		remotePerform: #forget:
		withString: '#(',aHandle printString,')'.