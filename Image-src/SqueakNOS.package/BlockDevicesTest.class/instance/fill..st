as yet unclassified
fill: aByteArray
	1 to: 512 do: [ :i | aByteArray at: i put: i \\ 256 ].