translation-private
pageTableIndexFor: anAddress
	| shifted trunced |
	shifted := anAddress bitShift: -12.
	trunced := shifted bitAnd: 16r000003FF.
	^trunced