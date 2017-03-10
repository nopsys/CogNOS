as yet unclassified
initialize
	super initialize.
	remote := RemoteObjectChannel for: self using: 'ParagraphEditorWithBindings new'