initialization
initializeVendorsAndDevicesMethod
	" self initializeVendorsAndDevicesMethod "
	" The old csv file was downloaded from http://www.pcidatabase.com/reports.php?type=csv "
	" We are currently using a more complete database from http://pci-ids.ucw.cz/ "
	| file data |
	file := StandardFileStream readOnlyFileNamed: 'info/Buses/pci/pci.ids'.

	data := ZLibWriteStream on: String new.
	data nextPutAll: file contents.
	data close.
	self class compile: 'vendorsAndDevicesZLibData',String cr,'   ^ ', data encodedStream contents storeString.
	