accessing
size
	| bytes |
	contents position: 16r1C.
	bytes := contents next: 4.
	^bytes unsignedLongAt: 1