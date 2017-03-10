"Based on the same file from the pharo-vm project"

Author useAuthor: 'LoadVMMaker' during: [ 
	Metacello new
        baseline: #Nopsys;
        repository: 'github://charig/nopsys/src';
        load ].

(Smalltalk saveAs: 'generator') 
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].