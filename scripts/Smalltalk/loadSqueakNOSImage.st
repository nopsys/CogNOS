Author useAuthor: 'LoadSqueakNOS' during: [ 

	"Based on the same file from the pharo-vm project"
	IceCredentialsProvider useCustomSsh: true.
"	IceCredentialsProvider sshCredentials
		publicKey: '/home/pocho/.ssh/id_rsa.pub';
		privateKey: '/home/pocho/.ssh/id_rsa'.
"
	myRepository := IceRepositoryCreator new
		url: 'https://github.com/nopsys/PharoNOS.git';
		createRepository.
	
    myRepository register.
	myRepository checkoutBranch: 'master'.
	(myRepository addPackageNamed: 'SqueakNOS') loadLatest.

].

(Smalltalk saveAs: (Smalltalk imageDirectory asFileReference) / 'SqueakNOS' )
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].




