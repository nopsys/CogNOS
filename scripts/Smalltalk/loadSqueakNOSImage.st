Author useAuthor: 'LoadSqueakNOS' during: [ 

((Smalltalk imageDirectory asFileReference) / '../scripts/Smalltalk/updateIceberg.st') fileIn.

"Based on the same file from the pharo-vm project"

	myRepository := IceRepositoryCreator new
	url: 'git@github.com:nopsys/CogNOS.git';
	subdirectory: 'Image-src';
	createRepository.
	
    (myRepository addPackageNamed: 'SqueakNOS') loadLatest.


((Smalltalk imageDirectory asFileReference) / '../scripts/Smalltalk/patchSqueakNOS.cs') fileIn.

].

(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'SqueakNOS' )




