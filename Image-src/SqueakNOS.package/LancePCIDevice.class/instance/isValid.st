as yet unclassified
isValid
	| ver |
	self reset: self reset.
	(self controlStatusWord: 0) ~= 4 ifTrue: [^ false].
	ver := self chipVersion.
	(ver isZero or: [(ver bitAnd: 16rFFF) == 3])
		ifFalse: [^ false].
	^ true