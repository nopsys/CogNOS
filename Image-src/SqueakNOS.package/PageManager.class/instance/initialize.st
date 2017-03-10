initialize-release
initialize 
	super initialize.
	handlers := Dictionary new.
	pageHandled := Semaphore new.
	interrupted := Semaphore new.
	

	
		