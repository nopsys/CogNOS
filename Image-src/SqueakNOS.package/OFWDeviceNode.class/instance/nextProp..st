as yet unclassified
nextProp: previous 
	| args buf |
	buf := String new: 32.
	args := self newArgsFor: 'getprop' inputs: 3 outputs: 1.
	args at: 4 put: phandle.
	args at: 5 put: previous, (Character value: 0) asString.
	args at: 6 put: buf.

	self callout: args.
	^ buf
