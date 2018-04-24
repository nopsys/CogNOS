Author useAuthor: 'LoadSqueakNOS' during: [ 
"First update Iceberg"

MetacelloPharoPlatform select.
#(
	'BaselineOfTonel'
	'BaselineOfLibGit'
	'BaselineOfIceberg'
	'Iceberg-UI' 
	'Iceberg-Plugin-GitHub' 
	'Iceberg-Plugin' 
	'Iceberg-Metacello-Integration' 
	'Iceberg-Libgit-Tonel' 
	'Iceberg-Libgit-Filetree' 
	'Iceberg-Libgit' 
	'Iceberg' 
	'Iceberg-Pharo6' 
	'LibGit-Core'
	'MonticelloTonel-Tests'
	'MonticelloTonel-Core'
	'MonticelloTonel-FileSystem' ) 
do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ].

Metacello new
	baseline: 'Iceberg';
	repository: 'github://pharo-vcs/iceberg:v0.6.8';
	load.
]      