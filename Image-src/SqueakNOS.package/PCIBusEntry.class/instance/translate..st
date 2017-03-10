private
translate: index
	^ 16r80000000 + (bus << 16) + (device << 11) + (function << 8) + (index bitAnd: 16rFC)
