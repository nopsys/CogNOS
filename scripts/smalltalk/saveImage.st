(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'CogNos' )
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].