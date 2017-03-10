accessing - frame list
frameListValueAt: index
	^frameList unsignedLongAt: index * 4 - 3