as yet unclassified
getProp: propertyName 
	| args len buf |
	len := self getPropLen: propertyName.
	buf := String new: len.
	args := self newArgsFor: 'getprop' inputs: 4 outputs: 1.
	args at: 4 put: phandle.
	args at: 5 put: propertyName, (Character value: 0) asString.
	args at: 6 put: buf.
	args at: 7 put: len.
	self callout: args.
	^ buf
