registers
atStatusReg
	"Contains information about the status of the drive and controller. The contents of
	 this register are updated at the completion of each command. When the busy bit
	 is set, no other bits in the Command Block Registers are valid. When the busy bit
	 is not set, the information in the Status Register and Command Block Registers is valid."
	
	^ self byteAt: 7
	
	"
	+-----+----------+----------------------------------------------------------+
	| BIT | Mnemonic | Description                                              
	+-----+----------+----------------------------------------------------------+
	|  7  |  BUSY    | Busy bit. Set by the controller logic of the drive when  
	|     |          | ever the drive has access to and the host is locked out 
	|     |          | of the Command Block Registers. Set under the following  
	|     |          | conditions:                                              
	|     |          |  o Within 400 nsec after the negation of RESET or after  
	|     |          |    SRST is set in the Device Control Register. After a   
	|     |          |    reset it is recomended that BUSY be set no more than  
	|     |          |    30 seconds.                                           
	|     |          |  o Within 400 nsec of a host write to the Command        
	|     |          |    Register with a Recalibrate, Read Long, Read Buffer,  
	|     |          |    Read, Read Verify, Initialize Drive Parameters, Seek  
	|     |          |    Identify Drive, or Execute Drive Diagnostic command.  
	|     |          |  o Within 5 microseconds following the transfer of 512   
	|     |          |    bytes of data during the execution of a Write, Write  
	|     |          |    Buffer or Format Track command; or 512 bytes of data  
	|     |          |    and the appropriate number of ECC bytes during the    
	|     |          |    execution of a Write Long command.                    
	|     |          |    When BUSY is set no Command Block Register can be     
	|     |          |    written too and a read of any Command Block Register  
	|     |          |    returns the contents of the Status Register.          
	|     |          |                                                          
	|  6  |  DRDY    | Drive Ready bit. Indicates that the drive is ready to    
	|     |          | accept commands. When and error occurs, this bit stays   
	|     |          | unchanged until the host reads the Status Register then  
	|     |          | again indicates that hte drive is ready. On power up,    
	|     |          | this bit should be cleared and should remain cleared     
	|     |          | until the drive is up to speed and ready to accept a     
	|     |          | command.                                                 
	|     |          |                                                          
	|  5  |  DWF     | Drive Write Fault bit. When an error occurs, this bit    
	|     |          | remains unchanged until the host reads the Status        
	|     |          | Register, then again indicates the current write fault   
	|     |          | status.                                                  
	|     |          |                                                          
	|  4  |  DSC     | Drive Seek Complete bit. This bit is set when a seek     
	|     |          | operation is complete and the heads are settled over a   
	|     |          | track. When an error occurs, this bit remains unchanged  
	|     |          | until the host reads the Status Register, then again it  
	|     |          | indicates the current seek complete status.              
	|     |          |                                                          
	|  3  |  DRQ     | Data Request bit. When set it indicates that the drive   
	|     |          | is ready to transfer a word or byte of data between the  
	|     |          | host and the data port.                                  
	|     |          |                                                          
	|  2  |  CORR    | Corrected Data bit. When a correctable data error has    
	|     |          | been encountered and the data has been corrected, this   
	|     |          | bit is set. This condition does not terminate a multi    
	|     |          | sector read operation.                                   
	|     |          |                                                          
	|  1  |  INDEX   | Index bit. Set when the index mark is detected once per  
	|     |          | disk revolution.                                         
	|     |          |                                                          
	|  0  |  ERROR   | Error bit. When set indicates that the previous command  
	|     |          | ended in an error. The other bits in the Error Register  
	|     |          | and Status Register contain additional information about 
	|     |          | the cause of the error.                                  
	+-----+----------+----------------------------------------------------------+
	"