debugging
primitivePushDebugString: aString
	|  length dataPtr |
	self var: #length type: 'unsigned int'.
	self primitive: 'primitivePushDebugString'
		parameters: #(#String).

	length := interpreterProxy slotSizeOf: aString cPtrAsOop.

	self cCode: 'printf_fixed_size(aString, length)'.
	"dataPtr := interpreterProxy firstIndexableField: dataOop."
