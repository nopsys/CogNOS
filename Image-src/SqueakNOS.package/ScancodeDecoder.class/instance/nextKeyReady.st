as yet unclassified
nextKeyReady
	 ^(actualScanCode == 16rE0 | (actualScanCode == 16rE1)) not. "If extended scancode we have to wait next to complete"
	
