mouse access
cursorPoint: aPoint
	self hideCursor.
	self mousePoint: aPoint.
	self showCursor.
