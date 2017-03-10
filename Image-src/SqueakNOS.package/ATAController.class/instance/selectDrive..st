accessing
selectDrive: aDriveNumber
	"Select master or slave (aDriveNumber is 0 or 1 respectively). See 
	 atDriveHeadRegPut for more details"
	^ self atDriveHeadRegPut: aDriveNumber << 4.