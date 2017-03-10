as yet unclassified
newArgsFor: serviceName inputs: aInteger outputs: bInteger
	| answer |
	answer := Array new: 3 + aInteger + bInteger.
	answer
		at: 1 put: serviceName, (Character value: 0) asString;
		at: 2 put: aInteger;
		at: 3 put: bInteger.
	^ answer
