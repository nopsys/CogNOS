accessing
disableCRCGeneration
	"clearing this bit will not automatically disable CRC generation.
	read comment on #enableCRCGeneration"
	^ self flagsBitClear: 5

