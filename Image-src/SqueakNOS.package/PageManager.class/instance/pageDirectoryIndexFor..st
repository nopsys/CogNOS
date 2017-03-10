translation-private
pageDirectoryIndexFor: anAddress
	| shifted trunced |
	shifted := anAddress bitShift: -22.
	trunced := shifted bitAnd: 16r000003FF.
	^trunced