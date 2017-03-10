debugging
primitiveEnableConsole
	| console |

	self primitive: 'primitiveEnableConsole'
		parameters: #().

	self var: #console type: 'extern Console'.
	self cCode: 'console.debugging_now = 1'.

