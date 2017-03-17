"Based on the same file from the pharo-vm project"

Author useAuthor: 'LoadSqueaNOS' during: [ 
	Metacello new
        baseline: #SqueakNOS;
        repository: 'github://charig/nopsys/Image-src';
        load ].

(Smalltalk saveAs: 'SqueakNOS') 
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].
