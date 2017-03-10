registers
atCommandRegPut: aSmallInteger
	"When the host request a command it is transferred to the hard drive through an eight bit code written to the command register. As soon as the drive receives a command in its command register, it begins execution of the command. The following table lists the commands in alphabetical order and the parameters for each executable command:"

	^ self byteAt: 7 put: aSmallInteger
	
	"
	+--------+---------------------------------+-----------------+
	| Command| Command Description             | Parameters Used 
	| Code   |                                 | PC SC SN CY DH  
	+--------+---------------------------------+-----------------+
	| 98h  @ | Check Power Mode                |    V        D   
	| E5h  @ | Check Power Mode (same as 98h)  |    V        D   
	| 90h    | Execute Drive Diagnostic        |             D+  
	| 50h    | Format Track                    |          V  V   
	| ECh  @ | Identify Drive                  |             D   
	| 97h  @ | Idle                            |    V        D   
	| E3h  @ | Idle (same as 97h)              |    V        D   
	| 95h  @ | Idle Immediate                  |             D   
	| E1h  @ | Idle Immadiate (same as 95h)    |             D   
	| 91h    | Initialize Drive Parameters     |    V        V   
	| E4h  @ | Read Buffer                     |             D   
	| C8h  @ | Read DMA With Retry             |  >> Unknown <<  
	| C9h  @ | Read DMA                        |  >> Unknown <<  
	| C4h  @ | Read Multiple                   |    V  V  V  V   
	| 20h    | Read Sectors With Retry         |    V  V  V  V   
	| 21h    | Read Sectors                    |    V  V  V  V   
	| 22h    | Read Long With Retry            |    V  V  V  V   
	| 23h    | Read Long                       |    V  V  V  V   
	| 40h    | Read Verify Sectors With Retry  |    V  V  V  V   
	| 41h    | Read Verify Sectors             |    V  V  V  V   
	| 1Xh    | Recalibrate                     |             D   
	| 7Xh    | Seek                            |          V  V   
	| EFh  @ | Set Features                    |  V          D   
	| C6h  @ | Set Multiple Mode               |    V        D   
	| 99h  @ | Set Sleep Mode                  |             D   
	| E6h  @ | Set Sleep Mode (same as 99h)    |             D   
	| 96h  @ | Standby                         |    V        D   
	| E2h  @ | Standby (same as 96h)           |    V        D   
	| 94h  @ | Standby Immediate               |             D   
	| E0h  @ | Standby Immediate (same as 94h) |             D   
	| 8Xh    | Vendor Unique                   |  >> Unknown <<  
	| 9Ah    | Vendor Unique                   |  >> Unknown <<  
	| C0h    | Vendor Unique                   |  >> Unknown <<  
	| C1h    | Vendor Unique                   |  >> Unknown <<  
	| C2h    | Vendor Unique                   |  >> Unknown <<  
	| C3h    | Vendor Unique                   |  >> Unknown <<  
	| F5h    | Vendor Unique                   |  >> Unknown <<  
	| F6h    | Vendor Unique                   |  >> Unknown <<  
	| F7h    | Vendor Unique                   |  >> Unknown <<  
	| F8h    | Vendor Unique                   |  >> Unknown <<  
	| F9h    | Vendor Unique                   |  >> Unknown <<  
	| FAh    | Vendor Unique                   |  >> Unknown <<  
	| FBh    | Vendor Unique                   |  >> Unknown <<  
	| FCh    | Vendor Unique                   |  >> Unknown <<  
	| FDh    | Vendor Unique                   |  >> Unknown <<  
	| FEh    | Vendor Unique                   |  >> Unknown <<  
	| FFh    | Vendor Unique                   |  >> Unknown <<  
	| E8h  @ | Write Buffer                    |             D   
	| CAh  @ | Write DMA With Retry            |  >> Unknown <<  
	| CBh  @ | Write DMA                       |  >> Unknown <<  
	| C5h  @ | Write Multiple                  |    V  V  V  V   
	| E9h  @ | Write Same                      |  >> Unknown <<  
	| 30h    | Write Sectors With Retry        |    V  V  V  V   
	| 31h    | Write Sectors                   |    V  V  V  V   
	| 32h    | Write Long With Retry           |    V  V  V  V   
	| 33h    | Write Long                      |    V  V  V  V   
	| 3Ch  @ | Write Verify                    |    V  V  V  V   
	+--------+---------------------------------+-----------------+
	"