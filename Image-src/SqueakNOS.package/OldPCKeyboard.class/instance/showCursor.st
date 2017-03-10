irq handling
showCursor
"	underCursorForm := Form fromDisplay: (mousePoint extent: Cursor currentCursor extent).
	Cursor currentCursor asCursorForm displayOn: Display at: mousePoint rule: Form reverse.
"