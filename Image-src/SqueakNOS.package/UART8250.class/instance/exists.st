testing
exists
	self enableLoopbackTesting.
	self readModemStatus.
	(modemStatus anyMask: 16rF0) ifTrue: [^ false].
	self modemControlRegister: 16r1F.
	self readModemStatus.
	(modemStatus bitAnd: 16rF0) = 16rF0 ifFalse: [^ false].
	self disableLoopbackTesting.
	^true
		