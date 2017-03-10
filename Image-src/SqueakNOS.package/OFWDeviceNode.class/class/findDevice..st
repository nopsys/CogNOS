as yet unclassified
findDevice: nodeName
	| args |
	args := self newArgsFor: 'finddevice' inputs: 1 outputs: 1.
	args at: 4 put: nodeName.
	self callout: args.
	^ self new handle: args last
