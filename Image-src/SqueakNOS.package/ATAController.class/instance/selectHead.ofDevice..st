accessing
selectHead: aHeadNumber ofDevice: aDeviceNumber
	"select head of drive. See atDriveHeadRegPut: for more details."
	^ self atDriveHeadRegPut: aDeviceNumber << 4 + aHeadNumber.