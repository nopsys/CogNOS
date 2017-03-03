debugging
primitiveDisableConsole
	| console |

	self primitive: 'primitiveDisableConsole'
		parameters: #().

	self var: #console type: 'extern Console'.
	self cCode: 'console.debugging_now = 0'.

