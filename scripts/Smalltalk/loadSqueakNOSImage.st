Author useAuthor: 'LoadSqueakNOS' during: [ 
	| myRepository |
	"Based on the same file from the pharo-vm project"
	IceCredentialsProvider useCustomSsh: false.
	myRepository := IceRepositoryCreator new
		url: 'https://github.com/nopsys/PharoNOS.git';
		createRepository.
	
    myRepository register.
	myRepository checkoutBranch: 'master'.
	(myRepository packageNamed: 'SqueakNOS') load.
	(myRepository packageNamed: 'Net') load.
].

(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'CogNos.image' )
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].




