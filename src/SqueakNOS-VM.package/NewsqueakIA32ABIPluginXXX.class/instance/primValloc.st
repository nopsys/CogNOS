as yet unclassified
primValloc
	"Malloc arg bytes."
	"primMalloc: byteSize <Integer> <^Integer>
		<primitive: 'primMalloc' error: errorCode module: 'IA32ABI'>"
	| byteSize addr |
	self export: true.
	self var: #byteSize type: 'long'.

	byteSize := interpreterProxy stackIntegerValue: 0.
	(interpreterProxy failed
	 or: [byteSize <= 0 "some mallocs can't deal with malloc(0) bytes"]) ifTrue:
		[^interpreterProxy primitiveFailFor: 1].
	self cCode: 'addr = (sqInt)valloc(byteSize)'
		inSmalltalk: [addr := self Cvalloc: byteSize].
	addr = 0 ifTrue:
		[^interpreterProxy primitiveFailFor: 2].
	interpreterProxy pop: 2 thenPush: (interpreterProxy positive32BitIntegerFor: addr)