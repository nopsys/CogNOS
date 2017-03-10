as yet unclassified
getPropLen: propertyName 
	| args |
	args := self newArgsFor: 'getproplen' inputs: 2 outputs: 1.
	args at: 4 put: phandle.
	args at: 5 put: propertyName, (Character value: 0) asString.
	self callout: args.
	^ args last
