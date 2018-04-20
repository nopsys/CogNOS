Author useAuthor: 'LoadSqueakNOS' during: [ 

	"Based on the same file from the pharo-vm project"
	IceCredentialsProvider useCustomSsh: true.
	IceCredentialsProvider sshCredentials
		publicKey: '/Users/guidochari/.ssh/gitKeys.pub';
		privateKey: '/Users/guidochari/.ssh/gitKeys'.

	myRepository := IceRepositoryCreator new
		url: 'git@github.com:nopsys/PharoNOS.git';
		createRepository.
	
    myRepository register.
	myRepository checkoutBranch: 'master'.
	(myRepository addPackageNamed: 'SqueakNOS') loadLatest.

].

(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'SqueakNOS' )
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].




