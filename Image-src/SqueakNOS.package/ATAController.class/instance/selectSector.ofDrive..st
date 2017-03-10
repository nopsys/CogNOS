accessing
selectSector: lbaAddress ofDrive: aDriveNumber

	"LBA Addressing: 28 bits. 
	<4 bits: head> < 8 bits: cyl high> <8 bits: cyl low> <8 bits: sector>
	We add 4 to drive number so that the bit of LBA addressing mode is asserted inside selectHead.
	"

	self
		atSectorNumberRegPut: (lbaAddress bitAnd: 16rFF);
		atCylinderLowRegPut: ((lbaAddress bitShift: -8) bitAnd: 16rFF);
		atCylinderHighRegPut: ((lbaAddress bitShift: -16) bitAnd: 16rFF);
		selectHead: ((lbaAddress bitShift: -24) bitAnd: 16rF) ofDevice: aDriveNumber + 4.