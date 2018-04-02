Author useAuthor: 'LoadSqueakNOS' during: [ 

((Smalltalk imageDirectory asFileReference) / '../scripts/Smalltalk/updateIceberg.st') fileIn.

"Based on the same file from the pharo-vm project"

	myRepository := IceRepositoryCreator new
	url: 'git@github.com:nopsys/PharoNOS.git';
	createRepository.
	
    (myRepository addPackageNamed: 'SqueakNOS') loadLatest.

].

(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'SqueakNOS' )
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].




