It is a 16 bytes table contained inside the MBR, it's contents are:

Offset  Description                                                          				  Size
00h		Current State of Partition (00h=Inactive, 80h=Active)         				1 Byte
01h		Beginning of Partition - Head                                   				1 Byte
02h		Beginning of Partition - Cylinder/Sector (See Below)         				1 Word
04h		Type of Partition (See List Below)                            					1 Byte
05h		End of Partition - Head                                       					1 Byte
06h		End of Partition - Cylinder/Sector                                         		1 Word
08h		Number of Sectors Between the MBR and the First Sector in the Partition	1 Double Word
0Ch		Number of Sectors in the Partition                                           	1 Double Word


