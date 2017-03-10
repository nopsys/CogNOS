accessing
bcdAt: index 
	| value |
	value := self at: index.
	^ value // 16 * 10 + (value \\ 16)