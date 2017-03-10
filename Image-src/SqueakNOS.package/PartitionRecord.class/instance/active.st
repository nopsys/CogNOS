as yet unclassified
active
	"00h	Current State of Partition (00h=Inactive, 80h=Active) 		1 Byte"
	^(bytes byteAt: 1) = 16r80.