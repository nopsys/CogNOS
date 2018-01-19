"Based on the same file from the pharo-vm project"

Author useAuthor: 'LoadVMMaker' during: [ 
	Metacello new
        baseline: #Nopsys;
        repository: 'github://nopsys/CogNOS/VM-src';
        load ].

(Smalltalk saveAs: 'generator') 
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].
