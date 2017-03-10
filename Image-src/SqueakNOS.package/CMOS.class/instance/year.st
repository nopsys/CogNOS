date
year
	| year |
	year := self valueAt: 9.
	^ self century * 100 + year