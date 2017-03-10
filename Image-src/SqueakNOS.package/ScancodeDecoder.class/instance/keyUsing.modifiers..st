as yet unclassified
keyUsing: aKeysMapping modifiers: modifiers
	| normalizedCode |
	normalizedCode := actualScanCode bitClear: 16r80.
	
	^(aKeysMapping at: (self correspondingMapWith: modifiers)) at: (normalizedCode ).
	