irq handling
hideCursor
	"underCursorForm ifNotNil: [underCursorForm displayOn: Display at: mousePoint]"
	self showCursor