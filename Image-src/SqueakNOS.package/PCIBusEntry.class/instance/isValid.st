accessing - general config
isValid
	| vendor |
	vendor := self vendorId.
	^ vendor ~= 0 and: [vendor ~= 16rFFFF].