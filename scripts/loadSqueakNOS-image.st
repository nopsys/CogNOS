Author useAuthor: 'LoadSqueakNOS’ during: [ 
	Metacello new
        baseline: #SqueakNOS;
        repository: 'github://charig/nopsys/Image-src';
        load ].

(Smalltalk saveAs: ‘SqueakNOS’) 
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].
