'From Pharo6.0 of 13 May 2016 [Latest update: #60539] on 23 March 2018 at 10:20:23.495733 pm'!
PlatformResolver subclass: #NopsysResolver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SqueakNOS-FileSupport'!

!NopsysResolver class methodsFor: 'accessing' stamp: 'JavierPimas 3/23/2018 19:25'!
platformName
	^'SqueakNOS'! !

!SqueakNOSPlatform class methodsFor: 'private' stamp: 'JavierPimas 3/23/2018 19:30'!
isActivePlatform
	^self currentPlatformName = 'SqueakNOS'! !


!VirtualMachine methodsFor: 'attributes' stamp: 'JavierPimas 3/23/2018 17:22'!
maxExternalSemaphores
	"The size of array in some VM's where external signals for
	semaphores in externalObjects are handled.
	Essentially, if a semaphore is registered in externalObjects outside
	its bounds, they will not be signalled."
	^ [self parameterAt: 49]
		on: Error
		do: [:ex | ex return: nil]! !


!NopsysResolver class reorganize!
(#accessing platformName)
!

