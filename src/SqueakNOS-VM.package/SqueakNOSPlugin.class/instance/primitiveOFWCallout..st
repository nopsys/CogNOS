as yet unclassified
primitiveOFWCallout: anArray
	| answer length element |
	self primitive: 'primitiveOFWCallout' parameters: #(Array).

"	self var: #args declareC: 'unsigned long args[]={&milliseconds, 0, 1, &milliseconds}'.
	self var: #args declareC: 'unsigned long args[]={&""interpret"", 1, 0, &"".\"" Hello VPRI2\""""}'.
"
	length := interpreterProxy slotSizeOf: anArray cPtrAsOop.

	answer := 0.

	"convert everything to native format"
	0 to: length-1 do: [:i |
		element := anArray at: i.
		(interpreterProxy isIntegerObject: element)
			ifTrue: [anArray at: i put: (interpreterProxy integerValueOf: element)]
			ifFalse: [anArray at: i put: (interpreterProxy firstIndexableField: element)]
	].

	self cCode: 'asm("call *OFW_callout" : "=a" (answer) : "a" ((unsigned int)anArray))'. 
	"milliseconds := args at: 3."

	"convert everything to integers. oops will be lost, but that's fine. The client should mantain a reference"
	0 to: length-1 do: [:i |
		element := anArray at: i.
		anArray at: i put: (interpreterProxy positive32BitIntegerFor: element)
	].

	answer = 0
		ifTrue: [^ self]
		ifFalse: [interpreterProxy primitiveFail].
