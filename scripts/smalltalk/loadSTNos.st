Author useAuthor: 'LoadSqueakNOS' during: [ 
	| myRepository |
	"Based on the same file from the pharo-vm project"
	IceCredentialsProvider useCustomSsh: false.
	myRepository := IceRepositoryCreator new
		url: 'https://github.com/nopsys/PharoNOS.git';
		createRepository.
	
    myRepository register.
	myRepository checkoutBranch: 'master'.
	(myRepository packageNamed: 'STNos-Devices') load.
	(myRepository packageNamed: 'STNos-ExternalStructs') load.
	(myRepository packageNamed: 'STNos-Filesystems') load.
	(myRepository packageNamed: 'STNos-Kernel') load.
	(myRepository packageNamed: 'STNos-Memory') load.
	(myRepository packageNamed: 'STNos-Network') load.
	(myRepository packageNamed: 'STNos-Pharo') load.
	(myRepository packageNamed: 'STNos-Storage') load.
	(myRepository packageNamed: 'STNos-Tests') load.
].