device protocol
open
	" tiene comentarios! "
	fifoStatus := 0.
	super open.
	self enableFIFO;
		triggerLevel: 4;
		resetInputQueue;
		resetOutputQueue.

		
		
	
